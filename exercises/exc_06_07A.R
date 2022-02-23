library(ggplot2)
data(BudgetFood, package = "Ecdat")

ggplot(data = _____, 
       mapping = aes(x = _____)) +
  geom______(aes(y = after_stat(density))) +
  geom______(color = "red")

