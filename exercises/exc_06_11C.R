library(tidyverse)
library(___)


g1 <- ggplot(BudgetFood, 
             aes(factor(size), wfood, colour = sex)) +
  geom_boxplot() 

g2 <- ggplot(BudgetFood, 
             aes(factor(size), totexp, colour = sex)) +
  geom_boxplot() + 
  scale_y_log10()

# combine the plot as one figure 
___ + plot_layout(guides = "collect")

