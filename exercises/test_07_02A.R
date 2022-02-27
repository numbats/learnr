
fit_correct <- lm(avgprs ~ taxs, data = Cigarette)
RSS_correct <- sum(residuals(fit_correct)^2)
expect_equal(RSS, RSS_correct, info = "Your RSS is incorrectly calculated.")
beta0_correct <- coef(fit_correct)[1]
expect_equal(beta0, beta0_correct, info = "Extract the beta0 coefficient using `coef()`")
beta1_correct <- coef(fit_correct)[2]
expect_equal(beta1, beta1_correct, info = "Extract the beta0 coefficient using `coef()`")
  
