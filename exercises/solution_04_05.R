# Let's try use read_csv to import the Australian Fires dataset from Github
# The url for this file is 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/rainfall.csv'

library(readr)
rainfall <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/rainfall.csv')

rainfall

