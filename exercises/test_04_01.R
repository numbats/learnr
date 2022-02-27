
expect_true(
  "readr" %in% loadedNamespaces(),
  info = "You haven't loaded a package which allows you to use to read in a CSV file."
)
    
solution <- readr::read_csv("data/penguins.csv")
expect_equal(penguins, solution, info = "Have you read in the file using the correct function described above?")

