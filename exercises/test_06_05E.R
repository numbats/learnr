  
plot <- last_plot()
plot_has_hist <- any(vapply(plot$layers, function(x) inherits(x$geom, "GeomBar"), logical(1L)))
expect_true(
  plot_has_hist, info = "Your plot is missing the appropriate geom for a scatter plot."
)
plot_mapping <- aes(x = wfood)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x axis are incorrect."
)
