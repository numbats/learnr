---
title: 'Chapter 4: Project structure and importing data'
description: This chapter will teach you the basic project structure and good practice
  of project management in R. You will also learn how to import data from different
  sources including csv files, excel files and files hosted online.
prev: /chapter3
next: /chapter5
type: chapter
id: 4

---
<exercise id="1" title="Getting start with an R project" type="slides">

<slides source="chapter4_01_Project_Structure"> </slides>

</exercise>

<exercise id="2" title="Organising your files">

There are many ways you can organise your files. The one principle you
should follow is that make sure all the files you used in your analysis
are stored within your R project folder.

The folder names that you use is a personal choice, and there is no best
approach. A project's folders should organise the files and have names
that adequately describes its contents. Often a project contains many
files with different purposes, including scripts, data, reports,
documents, and other outputs.

There are some common folder names that are used in analysis projects
that you might like to use.

-   Data is commonly stored in the 'data' folder, like we created in the
    slides. If you work with lots of data of different types, you could
    also use more folders inside your 'data' folder. For example, if the
    data you are working with need pre-processing and cleaning, you
    could have a 'data/original' and 'data/cleaned' folders to further
    organise the data files.

-   Scripts are commonly stored in folders of many different names. For
    R projects, an 'R' folder is commonly used (from the structure of an
    R package). Many data analysis projects use a 'scripts' folder, and
    more language agnostic projects might use a 'src' or 'code' folder.
    Often your code will be split across several scripts that perform
    different tasks, such as cleaning data, producing plots, and
    generating reports.

-   Outputs can be stored in many different folders which describe the
    type of output. For example, you may like to use a 'results' folder
    for analysis results, a 'plots' folder for plots, and a 'reports'
    folder for reports.

### Accessing your files in a project script

When reading and writing files in a script, you should always use
relative paths. Which of the following paths should you use to access
the 'traffic.csv' file in the data folder?

<choice id=0.539384470088407>

<opt text="~/data/traffic.csv" >

While the \~ refers to the user's home directory on all operating
systems, it doesn't ensure that the project is found there.

</opt>

<opt text="/data/traffic.csv" >

A relative path does not start with `/`

</opt>

<opt text="data/traffic.csv" correct="true">

Nicely done!

</opt>

<opt text="C:\Users\learnr\Documents\data\traffic.csv" >

This is the absolute path for Windows

</opt>

<opt text="/home/learnr/data/traffic.csv" >

This is the absolute path for macOS/Linux

</opt>

</choice>

</exercise>

<exercise id="3" title="Different file types" >

## Common data file formats

Data can come in many formats, and their file extension typically
provides clues into how it should be read into R.

There are many different data file types, a summary of some common
formats are:

-   `.csv`: CSV stands for **Comma Separated Values**. This is one of
    the common data files you will be working with. Each value is
    separated by `,` and rows are separated by new lines.

-   `.tsv`: TSV stands for **Tab Separated Values**. This similar to
    `.csv` but each value is separated by a tab.

-   `.fwf`: FWF stands for **Fixed Width File**. Each column of the data
    are represented with a specific number of characters, with no
    separator.

-   `.txt`: These are text files, and data within then can be structured
    in any way.

-   `.xls` and `.xlsx` are excel spreadsheets, these could contain
    anything and might require careful inspection to process correctly.

R also provides some serialised data formats. These can be useful for
storing and loading data only to be used in R, but it is usually better
to use more standard data formats. The advantage of serialised data
formats is that the column types and exact structure are saved, and so
they don't need parsing when the data is read.

-   `.RData`: This format can store multiple R objects in a single file.

-   `.RDS`: The RDS file format stores a single R object in a file.

What is the appropriate file extension for data stored in this way?

    ## species,island,bill_length_mm,bill_depth_mm,flipper_length_mm,body_mass_g,sex,year
    ## Adelie,Torgersen,39.1,18.7,181,3750,male,2007
    ## Adelie,Torgersen,39.5,17.4,186,3800,female,2007
    ## Adelie,Torgersen,40.3,18,195,3250,female,2007
    ## Adelie,Torgersen,NA,NA,NA,NA,NA,2007
    ## Adelie,Torgersen,36.7,19.3,193,3450,female,2007

<choice id=0.244310317095369>

<opt text=".csv" correct="true">

Well done.

</opt>

<opt text=".tsv" >

Almost, but not quite right! Check the character that separates columns
in the file contents above.

</opt>

<opt text=".fwf" >

Try again! The values stored in the above file do not have a constant
column size

</opt>

<opt text=".xlsx" >

Try again! This is not an excel spreadsheet.

</opt>

<opt text=".RDS" >

Try again! This is not a serialised file format.

</opt>

</choice>

</exercise>

<exercise id="4" title="Importing data into R" >

The file formats above can be read into R with functions from the
**readr** package. We encourage using this package to read data as it is
faster than their base equivalents, and creates a tibble instead of a
data.frame. We prefer to use tibble for storing our data, it has a
nicely formatted print output and has some features to prevent some
surprising (and likely incorrect) results.

There are many more advantages of using `readr` package. For further
reading you can see [R for Data Science - Data
Import](https://r4ds.had.co.nz/data-import.html#data-import).

-   `.csv`: These files can be read with `read_csv()` from the readr
    package.

-   `.tsv`: These files can be read with `read_tsv()` from the readr
    package.

-   `.fwf`: These files can be read with `read_fwf()` from the readr
    package. You will also need to specify the column widths in some
    way, such as using `fwf_widths()`.

-   `.txt`: These are text files, and data within then can be structured
    in any way. If the data is stored in a consistent table like
    structure you might be able to read it with `read_table()` from the
    readr package. If the structure is complex, you likely need to read
    the data line by line with `read_lines()` and process the format
    yourself.

-   `.RDS`: These serialised files can be read with `read_rds()` from
    the readr package.

The readr package does not allow you to read in excel spreadsheets, but
there are packages for this. We encourage using the **readxl** package
for reading data from these files.

-   `.xls` and `.xlsx` can be read in using the `read_excel()` function
    from the readxl package. You can only read one sheet at a time,
    which can be selected using the `sheet` argument.

As an `.RData` file can contain several objects, the readr package does
not support them. If you need to read the objects in from these files,
you would use the `load()` function from base R.

<codeblock id="04_01">

Hint: Just run this code and view the first six rows for this penguins
dataset

</codeblock>

## Import data from online sources

It is also possible to read data directly from the internet, by
providing a URL instead of a local file path.

</exercise>

<exercise id="6" title="Importing data from online sources" >

## Import data from online sources

So far we have learnt how to import data locally. Now we are going to
look at how we can read in data from online sources.

The example dataset we will be using is from the
[TidyTuesday](https://github.com/rfordatascience/tidytuesday) project.
The data we will try to import from website is the [Australian Fires
Data](https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-01-07).

<codeblock id="04_05">

Hint: Read this dataset in from the web, using the URL in the comment

</codeblock>

</exercise>

<exercise id="7" title="Exporting data from R" >

Despite the package's name, the **readr** package also helps you write
data from R to a file in many formats. We encourage you to save data
using a standard data file format, typically a csv format is
appropriate.

The functions to write data using the package is to simply replace
`read_*()` with `write_*()`. For instance, a csv file is read in using
`read_csv(<file_path>)`, and written out with
`write_csv(<data>, <file_path>)`.

<codeblock id="04_06">

Hint: Carefully read the desired file format to create, and search for
the function to produce it.

</codeblock>

</exercise>

<exercise id="8" title="Additional Resources" >

-   [R for Data Science - chapter 8](https://r4ds.had.co.nz)

-   [Project-oriented
    workflow](https://rstats.wtf/project-oriented-workflow.html)

-   [here package](https://here.r-lib.org)

-   [RStudio Eduction - Importing and saving
    data](https://rstudio-education.github.io/hopr/dataio.html)

-   [R for Data Science - Data
    Import](https://r4ds.had.co.nz/data-import.html#data-import).

-   [R Programming for Data Science - Getting data in and out of
    R](https://bookdown.org/rdpeng/rprogdatascience/getting-data-in-and-out-of-r.html)

</exercise>
