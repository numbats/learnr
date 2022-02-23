library(ggplot2)
data(BudgetFood, package = "Ecdat")

ggplot(data = BudgetFood, 
       mapping = aes(x = sex, 
                     y = age)) +
  geom_boxplot()

