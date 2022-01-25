library(ggplot2)
library(Ecdat)
ggplot(data = _____, 
       mapping = aes(x = _____)) +
  geom______(aes(y = after_stat(density))) +
  geom______(color = "red")
