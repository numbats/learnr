suppressPackageStartupMessages({
  library(ggplot2)
  library(Ecdat)
})

ggplot(data = _____, 
       mapping = aes(x = _____)) +
  geom______() +
  geom______(aes(label = _____),
                 vjust = -0.3,
                 stat = _____)

