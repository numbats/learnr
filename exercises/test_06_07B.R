
plot <- last_plot()

solution_data <- dplyr::filter(BudgetFood, !is.na(sex))
expect_equal(plot$data, solution_data, info = "The data has not been correctly filtered to look at only data where `sex` is 'man' or 'woman'.")

plot_has_violin <- vapply(plot$layers, function(x) inherits(x$geom, "GeomViolin"), logical(1L))
expect_true(
  any(plot_has_violin), info = "Your plot is missing the appropriate geom for a violin plot."
)
plot_has_boxplot <- vapply(plot$layers, function(x) inherits(x$geom, "GeomBoxplot"), logical(1L))
expect_true(
  any(plot_has_boxplot), info = "Your plot is missing the appropriate geom for a boxplot."
)
plot_mapping <- aes(x = sex, y = age)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x and/or y axis is incorrect."
)
violin_mapping <- plot$layers[[which(plot_has_violin)[1]]]$mapping
geom_mapping <- aes(fill = sex)
expect_equal(
  violin_mapping, geom_mapping, info = "The variable used to fill the violins is incorrect."
)

boxplot_width <- plot$layers[[which(plot_has_boxplot)[[1]]]]$geom_params$width
expect_equal(
  boxplot_width, 0.1, info = "The boxplot width has not been correctly specified."
)
