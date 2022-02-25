  
solution <- read.csv("data/penguins.csv")
expect_equal(penguins, solution, info = "Have you read in the correct file using read.csv()?")

