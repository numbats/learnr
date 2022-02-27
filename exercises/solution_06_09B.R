ggplot(data = subset(BudgetFood, !is.na(sex)), 
       mapping = aes(x = totexp,
                     fill = sex)) +
  geom_histogram(bins = 40,
                 aes(colour = sex)) + 
  scale_x_log10() +
  scale_colour_discrete() +
  scale_fill_brewer(palette = 10)
  

