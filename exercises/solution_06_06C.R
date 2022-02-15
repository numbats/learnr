library(ggplot2)
library(Ecdat)
ggplot(data = subset(BudgetFood, size < 30), 
       mapping = aes(x = size,
                     y = totexp)) +
  geom_point() +
  geom_smooth(color = "red",
                  method = loess,
                  formula = y ~ x)
