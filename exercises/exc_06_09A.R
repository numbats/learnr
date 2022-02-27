ggplot(data = subset(BudgetFood, !is.na(sex)), 
       mapping = aes(x = sex,
                     y = age)) +
  geom_violin(aes(fill = sex)) + 
  ____manual(values = c("violet", "royalblue"))
  

