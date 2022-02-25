
plot <- last_plot()
answer_mapping <- aes(x = age)
expect_equal(plot$mapping, answer_mapping, info = "The plot's mapping variables are incorrect.")
facet_type <- inherits(plot$facet, "FacetGrid")
expect_true(facet_type, info = "The facet type is incorrect.")
facet_rows <- identical(names(plot$facet$params$rows), "sex")
facet_cols <- identical(names(plot$facet$params$cols), "town")
expect_true(facet_rows, info = "The variable row facetting the plot is incorrect.")  
expect_true(facet_cols, info = "The variable column facetting the plot is incorrect.")  

plot_has_hist <- vapply(plot$layers, function(x) inherits(x$geom, "GeomBar"), logical(1L))

hist_aes <- plot$layers[[which(plot_has_hist)[[1]]]]$mapping
hist_aes_solution <- aes(y = after_stat(density))
expect_equal(
  hist_aes, hist_aes_solution, info = "The aesthetics for your histogram are incorrect. Note that you'll need to use after_stat() to use the variables computed by the histogram stat."
)
