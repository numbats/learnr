library(ggplot2)
library(Ecdat)
ggplot(data = subset(BudgetFood, !is.na(sex)), 
       mapping = aes(x = sex)) +
  geom_bar() +
  geom_text(aes(label = after_stat(count)),
                 vjust = -0.3,
                 stat = "count")
