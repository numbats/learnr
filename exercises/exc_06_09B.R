suppressPackageStartupMessages({
  library(tidyverse)
  library(Ecdat)
})


ggplot(data = filter(BudgetFood, !is.na(sex)), 
       mapping = aes(x = totexp,
                     fill = sex)) +
  geom_histogram(bins = 40,
                 aes(color = sex)) + 
  ______log10() +
  ______discrete() +
  ______brewer(palette = 10)
  

