data(Cigarette, package = "Ecdat")

fit <- lm(avgprs ~ taxs, data = Cigarette)
  
RSS <- sum(residuals(fit)^2)
beta0 <- coef(fit)[1]
beta1 <- coef(fit)[2]

