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

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.4     ✓ stringr 1.4.0
    ## ✓ readr   2.1.1     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x readr::edition_get()   masks testthat::edition_get()
    ## x dplyr::filter()        masks stats::filter()
    ## x purrr::is_null()       masks testthat::is_null()
    ## x dplyr::lag()           masks stats::lag()
    ## x readr::local_edition() masks testthat::local_edition()
    ## x dplyr::matches()       masks tidyr::matches(), testthat::matches()

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

Joins <codeblock id="06_03_02">

Hint:

</codeblock>

</exercise>

<exercise id="4" title="Tidy (reshape) your data" type="slides">

&lt;<slides source="chapter6_04_tidyr"> </slides>&gt;

</exercise>

<exercise id="5" title="Check Your Understanding on `tidyr`">

**Problem 1**

Which table is tidy?

<choice id=0.175283598946407>

<opt text="Table 1 only" correct="true">

That’s correct!

</opt>

<opt text="Table 3 only" >

Try again! Each cell in a tidy data format should hold only a single
value. The column `rate` contains data with two values (one divided by
the other) and is converted to characters.

</opt>

<opt text="Table 1 and 3" >

Try again! Each cell in a tidy data format should hold only a single
value. The column `rate` in Table 3 contains data with two values (one
divided by the other) and is converted to characters.

</opt>

<opt text="Table 2 and 3" >

Try again! Each cell in a tidy data format should hold only a single
value. The column `rate` in Table 3 contains data with two values (one
divided by the other) and is converted to characters. Table 2 contains
two variables under the same column ‘type’.

</opt>

</choice>

**Problem 2** Pivoting

<codeblock id="06_05_01">

</codeblock> **Problem 3**

Missing values

<codeblock id="06_05_02">

</codeblock>

**Congratulations! This is the end of Data Wrangling!** Here is a useful
cheat sheet from the RStudio with commands that we introduced and many
more:
<https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf>
</exercise>
