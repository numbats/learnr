  
plot <- last_plot()
plot_has_density <- vapply(plot$layers, function(x) inherits(x$geom, "GeomDensity"), logical(1L))
expect_true(
  any(plot_has_density), info = "Your plot is missing the appropriate geom for a density plot."
)
plot_has_hist <- vapply(plot$layers, function(x) inherits(x$geom, "GeomBar"), logical(1L))
expect_true(
  any(plot_has_hist), info = "Your plot is missing the appropriate geom for a histogram plot."
)
plot_mapping <- aes(x = totexp)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x axis is incorrect."
)
hist_mapping <- plot$layers[[which(plot_has_hist)[1]]]$mapping
geom_mapping <- aes(y = after_stat(density))
expect_equal(
  hist_mapping, geom_mapping, info = "The variable on your y axis is incorrect. Have you tried using the after_stat() function to show the computed density variable for the histogram?"
)

density_aes <- plot$layers[[which(plot_has_density)[[1]]]]$aes_params
density_colour <- rlang::`%||%`(density_aes$color, density_aes$colour)
expect_equal(
  density_colour, "red", info = "The colour of the density line geometry is not red."
)
