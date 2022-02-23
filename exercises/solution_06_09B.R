library(ggplot2)
data(BudgetFood, package = "Ecdat")


ggplot(data = filter(BudgetFood, !is.na(sex)), 
       mapping = aes(x = totexp,
                     fill = sex)) +
  geom_histogram(bins = 40,
                 aes(color = sex)) + 
  scale_x_log10() +
  scale_color_discrete() +
  scale_fill_brewer(palette = 10)
  

