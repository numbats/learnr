ggplot(BudgetFood, aes(x = ___)) + 
  geom_histogram(data = ___,
                 fill = "grey", binwidth = 1,
                 aes(y = after_stat(density))) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(colour = "red") +
  facet____
  
