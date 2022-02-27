library(testthat)
test_that(03_02{
???
library(dplyr)
expect_equal(
  total_dis,
  cars %>% mutate(total = dist*speed)
)
})
