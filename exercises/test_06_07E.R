  
plot <- last_plot()

plot_has_cols <- vapply(plot$layers, function(x) inherits(x$geom, "GeomCol"), logical(1L))
expect_true(
  all(plot_has_cols), info = "Your is using the incorrect geometry type."
)

col_aes <- plot$layers[[which(plot_has_cols)[[1]]]]$mapping
col_aes_solution <- aes(x = factor(town), y = totexp, fill = "woman")
expect_equal(
  col_aes, col_aes_solution, info = "The aesthetics for your geometry plotting `sex==\"woman\"` is incorrect. Have you set the fill aethetic correctly?"
)
col_aes <- plot$layers[[which(plot_has_cols)[[2]]]]$mapping
col_aes_solution <- aes(x = factor(town), y = -totexp, fill = "man")
expect_equal(
  col_aes, col_aes_solution, info = "The aesthetics for your geometry plotting `sex==\"man\"` is incorrect. Have you set the fill aethetic correctly?"
)
