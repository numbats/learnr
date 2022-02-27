plot <- last_plot()
plot_has_density <- vapply(plot$layers, function(x) inherits(x$geom, "GeomDensity"), logical(1L))
expect_true(
  any(plot_has_density), info = "Your plot is missing the appropriate geom for a density plot."
)
plot_mapping <- aes(x = wfood)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x axis is incorrect."
)
density_mapping <- plot$layers[[which(plot_has_density)[1]]]$mapping
geom_mapping <- aes(y = after_stat(count))
expect_equal(
  density_mapping, geom_mapping, info = "The variable on your y axis is incorrect. Have you tried using the after_stat() function to show the computed count variable?"
)
