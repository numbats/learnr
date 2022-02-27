
expect_true(file.exists("data/penguins.tsv"), info = "The file of the appropriate file extension could not be found in the data folder.")
  
penguins <- readr::read_csv("data/penguins.csv")
output <- readr::read_tsv("data/penguins.tsv")
expect_equal(output, penguins, info = "Have you read in the file using the correct function described above?")
