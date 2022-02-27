
data(cars)

total_dis <- cars %>%
  mutate(total = dist*speed)

head(total_dis)

