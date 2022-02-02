mtcars %>% 
  ggplot(aes(x = factor(cyl), y = mpg)) + 
  geom_boxplot()
