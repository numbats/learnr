library(tidyverse)
dat <- BudgetFood %>% 
  filter(!is.na(sex)) %>% 
  group_by(town, sex) %>% 
  summarise(totexp = mean(totexp))

ggplot() +
  geom_col(data = filter(dat, sex=="woman"),
               aes(x = factor(town),
                   y = totexp,
                  fill = "woman")) +
  geom_col(data = subset(dat, sex=="man"),
               aes(x = factor(town),
                   y = -totexp,
                  fill = "man"))

