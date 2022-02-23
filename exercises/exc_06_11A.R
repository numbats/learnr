library(tidyverse)
data(BudgetFood, package = "Ecdat")

ggplot(BudgetFood, aes(x = _____)) + 
  geom_histogram(data = _____,
                 fill = "grey", binwidth = 1,
                 aes(y = after_stat(density))) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(color = "red") +
  facet______
  
