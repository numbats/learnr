library(tidyverse)
data(BudgetFood, package = "Ecdat")

ggplot(BudgetFood, aes(x = age)) + 
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(color = "red") +
  facet_wrap(~town, labeller = label_both) +
  labs(x = "Age", y = "Density", title = "Age distribution by town size") +
  theme(text = element_text(size = 14, family = "mono"),
        plot.background = element_rect(fill = "grey80"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(color = "white"),
        panel.background = element_rect(fill = "white",
                                        color = "black"),
        panel.grid = element_blank())

