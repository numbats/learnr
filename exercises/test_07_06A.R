library(testthat)

test <- function() {
  fit <- lm(avgprs ~ -1 + state, data = Cigarette)
  expect_equal(betas, coef(fit))
  success("You got it right! Did you notice what the `betas` values are?")
}  
  
