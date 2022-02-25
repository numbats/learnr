library(tidyverse)
library(___)


g1 <- ggplot(BudgetFood, 
             aes(factor(size), wfood, color = sex)) +
  geom_boxplot() 

g2 <- ggplot(BudgetFood, 
             aes(factor(size), totexp, color = sex)) +
  geom_boxplot() + 
  scale_y_log10()

# combine the plot as one figure 
___ + plot_layout(guides = "collect")

