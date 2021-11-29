options(tidyverse.quiet = TRUE)
library(tidyverse)

mtcars <- mtcars %>%
  mutate(am = factor(am, levels = 0:1, labels = c("Automatic", "Manual")))


# Print the gear variable of mtcars
mtcars$____

# Assign the number of rows in mtcars to `n`
n <- ____

# Uncomment this to see the plot
# ggplot(mtcars, aes(am, mpg)) + geom_violin()
