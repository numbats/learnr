library(dplyr)
expect_equal(
  total_dis,
  cars %>% mutate(total = dist*speed)
)
