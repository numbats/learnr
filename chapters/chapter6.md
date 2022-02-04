---
title: 'Chapter 6: Data Wrangling'
description: In this chapter, you will learn to use tidyr and dplyr from the tidyverse
  in R.
prev: /chapter5
next: /chapter7
type: chapter
id: 6

---
<exercise id="1" title="Introduction to tidyverse">

## Introduction to tidyverse

The tidyverse is a collection of R packages that transform and visualize
data. All packages of the tidyverse share very similar syntax and
ideologies.

Tidyverse includes the following packages:

-   `dplyr`: grammar of data manipulation
-   `tidyr`: reshape your data
-   `ggplot2`: grammar of graphics
-   `readr`: read rectangular data
-   `tibble`: re-imagining of data frame
-   `stringr`: working with string data

and many more…

There are many other packages with more specialized functions in the
tidyverse. In this chapter, we focuses on two packages: **tidyr** and
**dplyr**.

**dplyr** is used for grammar of data manipulation. **tidyr** helps you
to create tidy data or data where each variable is in a column, each
observation is a row and each value is a cell. You can use them to solve
the most common data manipulation challenges.

You can install the core tidyverse packages with:
`install.packages("tidyverse")`

Then, to load the package:

    library(tidyverse)

You can also load specific library separately, for example,
`library(dplyr)`.

</exercise>

<exercise id="2" title="Introduction to dplyr" type="slides">

&lt;<slides source="chapter6_02_dplyr"> </slides>&gt;

</exercise>

<exercise id="3" title="Check Your Understanding on `dplyr`">

**Problem 1** In this problem, we will use the `iris` data set. The
`iris` dataset is a built-in dataset in R that contains measurements on
4 different attributes (in centimeters) for 50 flowers from 3 different
species: setosa, versicolor,virginica.

Create a new dataframe from the `iris` data set that meets the following
criteria: contains only the `Sepal.Length` column and a new column
called `petal_area` containing a value that approximates the area of the
petal. (`Petal.Length` times `Petal.Width`). Only the rows where
`petal_area` is greater than 5 should be shown in the final dataframe.
The final dataframe should be called `new_iris`.

<codeblock id="06_03_01">

Hint: You can use `mutate()`, `filter()` and `select()` to help with the
task.

</codeblock>

**Problem 2**

Consider the data sets `size` and `color`.

    size <- tibble(
      product_name = c('mini', 'pro', 'maxi'),
      diameter = c(23, 27, 32)
    )

    color <- tibble(
      product_name = c('mini','light', 'pro'),
      hue = c('red','green', 'silver')
    )

We would like to merge the tables so that the result looks like:

    # A tibble: 4 × 3
      product_name hue    diameter
      <chr>        <chr>     <dbl>
    1 mini         red          23
    2 light        green        NA
    3 pro          silver       27
    4 maxi         NA           32

Which of the following commands does the operation?

    ## [1] "<choice id=0.143768886337057>\n\n<opt text=\"inner_join(color, size)\" >\n\nTry again!\n\n</opt>\n\n<opt text=\"left_join(color, size)\" >\n\nTry again!\n\n</opt>\n\n<opt text=\"right_join(color, size)\" >\n\nTry again!\n\n</opt>\n\n<opt text=\"full_join(color, size)\" correct=\"true\">\n\nThat's right!\n\n</opt>\n\n</choice>"

</exercise>

<exercise id="4" title="Tidy (reshape) your data" type="slides">

&lt;<slides source="chapter6_04_tidyr"> </slides>&gt;

</exercise>

<exercise id="5" title="Check Your Understanding on `tidyr`">

**Problem 1**

Which table is tidy?

\[1\] “<choice id=0.887109126895666>&lt;opt text="Table 1 only"
correct="true">‘s correct!</opt>&lt;opt text="Table 3 only" &gt;again!
Each cell in a tidy data format should hold only a single value. The
column `rate` contains data with two values (one divided by the other)
and is converted to characters.</opt>&lt;opt text="Table 1 and 3"
&gt;again! Each cell in a tidy data format should hold only a single
value. The column `rate` in Table 3 contains data with two values (one
divided by the other) and is converted to characters.</opt>&lt;opt
text="Table 2 and 3" &gt;again! Each cell in a tidy data format should
hold only a single value. The column `rate` in Table 3 contains data
with two values (one divided by the other) and is converted to
characters. Table 2 contains two variables under the same column
’type’.</opt></choice>”

**Problem 2** Consider the following simple table `smoke`, which command
do I need to transform `smoke` to `smoke2`?

    smoke <- tribble(
      ~smoke, ~employed, ~unemployed,
      "yes", 23, 10,
      "no", 20, 12
    )

    smoke2
    # A tibble: 4 × 3
      smoke employment_status count
      <chr> <chr>             <dbl>
    1 yes   employed             23
    2 yes   unemployed           10
    3 no    employed             20
    4 no    unemployed           12

    ## [1] "<choice id=0.956487833755091>\n\n<opt text=\"Using pivot_wider() on smoke\" >\n\nTry again!\n\n</opt>\n\n<opt text=\"Using pivot_longer() on smoke\" correct=\"true\">\n\nThat's correct!\n\n</opt>\n\n<opt text=\"Using select() on smoke\" >\n\nTry again!\n\n</opt>\n\n<opt text=\"Using filter() on smoke\" >\n\nTry again!\n\n</opt>\n\n</choice>"

**Problem 3** Which is the best way to check if there are missing
observations in your data?

    ## [1] "<choice id=0.0667221460025758>\n\n<opt text=\"Eyeballing and look for blanks in my data\" >\n\nThat's not very effective nor efficient. Use R command to help you!\n\n</opt>\n\n<opt text=\"Eyeballing and look for `blanks`NA` in my data\" >\n\nThat's not very effective nor efficient. Use R command to help you!\n\n</opt>\n\n<opt text=\"Using is.na() on my data\" correct=\"true\">\n\nTry again!\n\n</opt>\n\n<opt text=\"There is no need to find the missing values. We can ignore them.\" >\n\nThat's incorrect.\n\n</opt>\n\n</choice>"

**Congratulations! This is the end of Data Wrangling!** Here is a useful
cheat sheet from the RStudio with commands that we introduced and many
more:
<https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf>
</exercise>
