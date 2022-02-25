
plot <- last_plot()
plot_has_hex <- any(vapply(plot$layers, function(x) inherits(x$geom, "GeomHex"), logical(1L)))
expect_true(
  plot_has_hex, info = "Your plot is missing the appropriate geom for a hex plot."
)
plot_mapping <- aes(x = size, y = totexp)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x and/or y axis are incorrect."
)  
