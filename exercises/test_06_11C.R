  
  
expect_true(
  "patchwork" %in% loadedNamespaces(),
  info = "You haven't loaded a package which allows you to combine g1 and g2."
)

plot <- last_plot()
expect_true(inherits(plot, "patchwork"), info = "The plot outputted does not use the patchwork package to produce it.")
