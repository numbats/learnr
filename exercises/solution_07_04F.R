library(ggplot2)
library(Ecdat)
ggplot(data = BudgetFood, 
       mapping = aes(x = wfood))  +
  geom_density(aes(y = after_stat(count)))

