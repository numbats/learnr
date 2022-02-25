  
plot <- last_plot()

solution_data <- dplyr::filter(BudgetFood, size < 30)
expect_equal(plot$data, solution_data, info = "The data has not been correctly filtered to look at only data size is less than 30.")

plot_has_point <- vapply(plot$layers, function(x) inherits(x$geom, "GeomPoint"), logical(1L))
expect_true(
  any(plot_has_point), info = "Your plot is missing the appropriate geom for a scatter plot."
)
plot_has_smooth <- vapply(plot$layers, function(x) inherits(x$geom, "GeomSmooth"), logical(1L))
expect_true(
  any(plot_has_smooth), info = "Your plot is missing the appropriate geom for a smooth fitted model through the data."
)
plot_mapping <- aes(x = size, y = totexp)
expect_equal(
  plot$mapping, plot_mapping, info = "The variables on your x and/or y axis is incorrect."
)

smooth_aes <- plot$layers[[which(plot_has_smooth)[[1]]]]$aes_params
smooth_colour <- rlang::`%||%`(smooth_aes$color, smooth_aes$colour)
expect_equal(
  smooth_colour, "red", info = "The colour of the smooth line geometry is not red."
)
