  
plot <- last_plot()
plot_scale <- vapply(plot$scales$scales, function(x) x$aesthetics == "fill", logical(1L))
expect_true(plot_scale, info = "The scale function has been incorrectly specified.")
