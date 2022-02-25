
solution <- read_csv("data/penguins.csv")
expect_identical(penguins_readr, solution, info = "Have you used the correct function to read in the data?")

