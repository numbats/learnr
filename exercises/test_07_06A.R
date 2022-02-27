
fit_answer <- lm(avgprs ~ -1 + state, data = Cigarette)
expect_equal(fit$residuals, fit_answer$residuals, info = "Your model does not correctly model what was described above.")

expect_equal(betas, coef(fit_answer), info = "The coefficients in the betas variable are incorrect.")
  
