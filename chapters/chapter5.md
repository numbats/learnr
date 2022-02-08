---
title: 'Chapter 5: Importing and exporting data '
description: This chapter will show you how to import data from different sources
  including csv files, excel files and files hosted online
prev: /chapter4
next: /chapter6
type: chapter
id: 5

---
<exercise id="1" title="Different file types" >

## Data files types

There are many different data file types including `.csv`,
`.tsv`,`.xls`,`.xlsx` and`.text` you will be working with for your
future study and work.

-   `.csv`: It stands for **Comma Separated Values**. This is one of the
    common data files you will be working with. Each single value is
    separated by `,`.

-   `.tsv`: It stands for **Tab Separated Values**. This similar to
    `.csv` but each value is separated by ``.

-   `.xls` and `.xlsx` are both excel file data.

-   `.txt`: This is type of file are text files data.

For each different type of data, we use different functions to import
data files to RStudio.

## R files

-   `.RData`: This R file can store multiple R objects.

-   `.RDS`: This type of R file can only store single R object.

</exercise>

<exercise id="2" title="Importing Data to RStudio" >

## Importing data with base R

There are a few different packages that help you read in data to
RStudio. First, let’s meet the `read` family from base R.

-   `read.table()`: can be used for general-purpose.

-   `read.csv()`: this is used for csv files where each value is
    separated by comma `,`.

-   `read.delim()`: this is used for tab-delimited files.

-   `read.csv2()`: this is used for csv files where each value is
    separated by `;` for European R users.

-   `read.delim2()`: this is used for delimited files with European
    decimal format.

The above functions are all part of base R functions that will help you
import different data file to your R environment.

To import excel data file, we need to use `readxl` package.

-   `read_excel()` helps us read in both `.xls` and `.xlsx` files.

In order to successfully import data to your RStudio environment, you
will need to put in the path to your file and the correct file name in
`()`. Recall in chapter 4 where we set up our working directory, we need
to put all our project related files in one working directory. The path
to your data files need to be a **relative path**.
i.e. `"/data/covid_cases_aus.csv"`. Noted that the file path and name
you put in `()` need to have double quotation `""`.

<codeblock id="05_01">

</codeblock>

</exercise>

<exercise id="3" title="Importing Data with readr package" >

## Importing Data to RStudio with `readr`

`readr` package provides the same function that base R.

-   `read_csv()` and `read_csv2()` read in **csv** files. When read in
    data, it will automatically take the first row as column names.

<codeblock id="05_02">

</codeblock>

<codeblock id="05_03">

</codeblock>

Comparing with the base R function, you would see the outputs are
different. `read_csv` prints out a column specification that gives the
name and type of each column.

There are other functions from `readr` package which help you import
different data files.

-   `read_tsv()` reads tab delimited files.

-   `read_delim()` reads in files with any delimiter.

You might ask why do we need to use `readr` package when there are base
R functions that does similar thing. One major advantage of using
`readr` is that it makes reading large data file a lot faster than the
base R function.

There are many more advantages of using `readr` pacakge. For further
reading, [R for Data Science - Data
Import](https://r4ds.had.co.nz/data-import.html#data-import).

</exercise>

<exercise id="4" title="Exporting Data" >

## Save your data as `.csv`

Once you have done some cleaning and data mulptipultion, you can save
the new dataset as a new **csv** file using `write.csv()` function. You
can put the file path and file name inside `()`.

## Save your data as `.RDS`

Saving data as `.RDS` provides some advantages over plain-text file. R
automatically compresses the file and will also save any R-related
metadata associated with your object. This can be handy if your data
contains factors, dates and times, or class attributes. To save data as
`.RDS`, use `saveRDS(object, file = "")`. When using `saveRDS()`
function, replace object with the name of the data frame you want to
save and put in the path and file name in `file = ""`.

To read in the `.RDS` file, use `readRDS()` with the file path and name
in `()` with `""` .

## Save your data as `.RData`

You can also save multiple R objects as `.RData` using `save()`
function. For example, you can save R objects into one `.RData`
including `x`,`y`and `z` using
`save(x,y,z, file = "data/example.RData")`. To import this `.RData`, you
can use `load()` function.

When you save your data as `.RDS` and `.RData`, it can only be imported
to a few program including RStudio. Therefore if you want to open the
dataset in other programs, you might want to save it as `.csv`.

</exercise>
