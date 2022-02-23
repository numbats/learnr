library(ggplot2)
data(BudgetFood, package = "Ecdat")

ggplot(data = BudgetFood, 
       mapping = aes(x = size, 
                     y = totexp)) +
  geom_hex()

