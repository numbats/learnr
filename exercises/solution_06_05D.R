ggplot(data = BudgetFood, 
       mapping = aes(x = factor(town), 
                     y = totexp)) +
  geom_violin()

