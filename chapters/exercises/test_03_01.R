library(testthat)
test <- function() {
expect_true(
  "dplyr" %in% loadedNamespaces())
expect_true(
  "tidyverse" %in% loadedNamespaces())
  success("Well done!")
}  
