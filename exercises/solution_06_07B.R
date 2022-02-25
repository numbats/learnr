library(tidyverse)
BudgetFood %>%
  filter(!is.na(sex)) %>%
  ggplot(
    mapping = aes(x = sex, y = age)
  ) +
  geom_violin(aes(fill = sex)) +
  geom_boxplot(width = 0.1) 

