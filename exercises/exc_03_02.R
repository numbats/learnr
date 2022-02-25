
total_dis <- cars %>%
  mutate(total = dist*sped)

total_dis %>% head()

