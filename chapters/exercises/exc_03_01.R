
data(cars)

total_dis <- cars %>%
  mutate(total = dist*speed)

total_dis %>% head()

