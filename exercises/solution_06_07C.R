BudgetFood %>%
  filter(size < 30) %>%
  ggplot(
    mapping = aes(x = size, y = totexp)
  ) +
  geom_point() +
  geom_smooth(colour = "red",
                  method = loess,
                  formula = y ~ x)

