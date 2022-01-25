ggplot(subset(BudgetFood, !is.na(sex)), aes(age)) +
  geom_histogram(aes(y = after_stat(density))) +
  geom_text(x = 35, y = 0.035, 
            data = function(.data) .data %>% 
              group_by(sex, town) %>% 
              count(),
            aes(label = n)) +
  facet_grid(sex ~ town)
