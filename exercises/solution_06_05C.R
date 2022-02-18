suppressPackageStartupMessages({
  library(ggplot2)
  library(Ecdat)
})

ggplot(data = BudgetFood, 
       mapping = aes(x = sex, 
                     y = age)) +
  geom_boxplot()

