  
plot <- last_plot()

solution_data <- dplyr::filter(BudgetFood, !is.na(sex))
expect_equal(plot$data[colnames(solution_data)], solution_data, info = "The data has not been correctly filtered to look at only data where `sex` is 'man' or 'woman'.")

plot_has_bar <- vapply(plot$layers, function(x) inherits(x$geom, "GeomBar"), logical(1L))
expect_true(
  any(plot_has_bar), info = "Your plot is missing the appropriate geom for a bar plot."
)
plot_has_text <- vapply(plot$layers, function(x) inherits(x$geom, "GeomText"), logical(1L))
expect_true(
  any(plot_has_text), info = "Your plot is missing the appropriate geom for a text shown above the bars."
)
plot_mapping <- aes(x = sex)
expect_equal(
  plot$mapping, plot_mapping, info = "The variable on your x axis is incorrect."
)

text_aes <- plot$layers[[which(plot_has_text)[[1]]]]$mapping
text_aes_solution <- aes(label = after_stat(count))
expect_equal(
  text_aes, text_aes_solution, info = "The aesthetics for your text labels are incorrect. Hint: this can be computed with after_stat()."
)

has_text_stat <- inherits(plot$layers[[which(plot_has_text)[[1]]]]$stat, "StatCount")
expect_true(
  has_text_stat, info = "Your text geometry is missng the stat used to compute the appropriate position on the y-axis."
)
