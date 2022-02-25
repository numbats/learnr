  
plot <- last_plot()
plot_has_violin <- any(vapply(plot$layers, function(x) inherits(x$geom, "GeomViolin"), logical(1L)))
expect_true(
  plot_has_violin, info = "Your plot is missing the appropriate geom for a violin plot."
)
plot_mapping <- aes(x = factor(town), y = totexp)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x and/or y axis are incorrect."
)
