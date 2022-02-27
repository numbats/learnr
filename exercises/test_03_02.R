library(dplyr)
answer <- cars %>% mutate(total = dist*speed)
expect_match(.solution, "library", info = "You should load the required packages in using the library() function.")
expect_equal(
  total_dis,
  answer,
  info = "The resulting `total_dis` dataset doesn't match what we wanted."
)
