library(tidyverse)

mtcars <- mtcars %>%
  mutate(am = factor(am, levels = 0:1, labels = c("Automatic", "Manual")))


# Print the gear variable of mtcars
mtcars$gear

# Assign the number of rows in mtcars to `n`
n <- nrow(mtcars)

# Uncomment this to see the plot
# ggplot(mtcars, aes(am, mpg)) + geom_violin()
