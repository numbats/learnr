library(ggplot2)
library(Ecdat)
ggplot(data = _____, 
       mapping = aes(x = _____,
                     y = _____)) +
  geom______() +
  geom______(color = "red",
                  method = loess,
                  formula = y ~ x)
