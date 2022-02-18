suppressPackageStartupMessages({
  library(tidyverse)
  library(Ecdat)
})



ggplot(data = filter(BudgetFood, !is.na(sex)), 
       mapping = aes(x = sex,
                     y = age)) +
  geom_violin(aes(fill = sex)) + 
  ______manual(values = c("violet", "royalblue"))
  

