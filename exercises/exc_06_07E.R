suppressPackageStartupMessages({
  library(tidyverse)
  library(Ecdat)
})

dat <- BudgetFood %>% 
  filter(!is.na(sex)) %>% 
  group_by(town, sex) %>% 
  summarise(totexp = mean(totexp))

_____ +
  geom______(data = filter(dat, sex=="woman"),
               aes(x = _____,
                   y = _____,
                  _____)) +
  geom______(data = filter(dat, sex=="man"),
               aes(x = _____,
                   y = _____,
                  _____))

