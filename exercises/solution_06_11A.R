ggplot(BudgetFood, aes(x = age)) + 
  geom_histogram(data = select(BudgetFood, -town),
                 fill = "grey", binwidth = 1,
                 aes(y = after_stat(density))) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(colour = "red") +
  facet_wrap(~town)
  
