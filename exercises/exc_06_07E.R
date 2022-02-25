library(tidyverse)
dat <- BudgetFood %>% 
  filter(!is.na(sex)) %>% 
  group_by(town, sex) %>% 
  summarise(totexp = mean(totexp))

___ +
  geom____(data = filter(dat, sex=="woman"),
               aes(x = ___,
                   y = ___,
                  ___)) +
  geom____(data = subset(dat, sex=="man"),
               aes(x = ___,
                   y = ___,
                  ___))

