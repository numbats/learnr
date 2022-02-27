
plot <- last_plot()
plot_has_boxplot <- any(vapply(plot$layers, function(x) inherits(x$geom, "GeomBoxplot"), logical(1L)))
expect_true(
  plot_has_boxplot, info = "Your plot is missing the appropriate geom for a boxplot."
)
plot_mapping <- aes(x = sex, y = age)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x and/or y axis are incorrect."
)  
