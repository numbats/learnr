data(Cigarette, package = "Ecdat")

fit <- lm(avgprs ~ -1 + state, data = Cigarette)
  
betas <- coef(fit)
betas

