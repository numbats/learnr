ggplot(data = subset(BudgetFood, !is.na(sex)), 
       mapping = aes(x = totexp,
                     fill = sex)) +
  geom_histogram(bins = 40,
                 aes(color = sex)) + 
  ____log10() +
  ____discrete() +
  ____brewer(palette = 10)
  

