library(testthat)

test <- function() {
  fit <- lm(avgprs ~ taxs, data = Cigarette)
  expect_equal(RSS, sum(residuals(fit)^2))
  expect_equal(beta0, coef(fit)[1])
  expect_equal(beta1, coef(fit)[2])
}  
  
