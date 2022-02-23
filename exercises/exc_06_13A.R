library(tidyverse)
data(BudgetFood, package = "Ecdat")

ggplot(BudgetFood, aes(x = age)) + 
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(color = "red") +
  facet_wrap(~town, labeller = label_both) +
  labs(x = "Age", y = "Density", title = "Age distribution by town size") +
  theme(text = _____(size = 14, family = "mono"),
        plot.background = _____(fill = "grey80"),
        _____ = element_rect(fill = "black"),
        _____ = element_text(color = "white"),
        panel.background = _____(fill = "white",
                                        color = "black"),
        panel.grid = element_blank())

