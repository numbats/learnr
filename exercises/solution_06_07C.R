library(ggplot2)
data(BudgetFood, package = "Ecdat")

ggplot(data = filter(BudgetFood, size < 30), 
       mapping = aes(x = size,
                     y = totexp)) +
  geom_point() +
  geom_smooth(color = "red",
                  method = loess,
                  formula = y ~ x)

