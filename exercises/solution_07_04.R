library(ggplot2)
ggplot(data = cars, 
       mapping = aes(x = speed, 
                     y = dist)) +
  geom_point()
