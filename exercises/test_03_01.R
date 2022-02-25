expect_true(
  "magrittr" %in% loadedNamespaces(),
  info = "You haven't loaded a package which allows you to use the pipe (%>%)."
)
expect_true(
  "dplyr" %in% loadedNamespaces(),
  info = "You haven't loaded a package which allows you to use the mutate() function."
)
