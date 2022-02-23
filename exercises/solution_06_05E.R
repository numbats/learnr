library(ggplot2)
data(BudgetFood, package = "Ecdat")

ggplot(data = BudgetFood, 
       mapping = aes(x = wfood)) +
  geom_histogram(binwidth = 0.001)

