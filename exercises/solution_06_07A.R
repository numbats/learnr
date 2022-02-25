ggplot(data = BudgetFood, 
       mapping = aes(x = totexp)) +
  geom_histogram(aes(y = after_stat(density))) +
  geom_density(colour = "red")

