BudgetFood %>% 
  filter(!is.na(sex)) %>% 
  ggplot(mapping = aes(x = sex)) +
  geom_bar() +
  geom_text(
    aes(label = after_stat(count)),
    vjust = -0.3,
    stat = "count"
  )

