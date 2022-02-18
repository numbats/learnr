suppressPackageStartupMessages({
  library(ggplot2)
  library(Ecdat)
})

ggplot(data = BudgetFood, 
       mapping = aes(x = size, 
                     y = totexp)) +
  geom_hex()

