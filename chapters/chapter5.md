---
title: 'Chapter 5: Data wrangling with R'
description: In this chapter, you will learn to use tidyr and dplyr from the tidyverse
  in R for tidying your data set and data maniplulation.
prev: /chapter4
next: /chapter6
type: chapter
id: 5

---
<exercise id="1" title="Introduction to tidyverse">

## Introduction to tidyverse

The tidyverse is a collection of R packages that transform and visualize
data. They aim to be cohesive with each other and provide simple
building block functions for you to use in complex applications. All
packages of the tidyverse share very similar syntax and ideologies.

The tidyverse includes the following packages:

-   `dplyr`: grammar of data manipulation
-   `tidyr`: reshape your data
-   `ggplot2`: grammar of graphics
-   `readr`: read rectangular data
-   `tibble`: re-imagining of data frame
-   `stringr`: working with string data

and many more...

There are many other packages with more specialized functions in the
tidyverse. In this chapter, we focuses on two packages: **tidyr** and
**dplyr**.

**dplyr** makes manipulating data easy. **tidyr** helps you to create
"tidy data" (data where each variable is in a column, each observation
is a row and each value is a cell). It helps with adding, renaming, and
removing columns, computing new variables, joining data sets together
and summarising your data. You can use them to solve the most common
data manipulation challenges.

You can install the core tidyverse packages with:
`install.packages("tidyverse")`

Then, to load the package:

``` {.r}
library(tidyverse)
```

You can also load specific library separately, for example,
`library(dplyr)`.

**Pipes**

`%>%` is a "pipe"-like operator with which you may pipe a value forward
into the next function. Instead of writing `f(x)`, it allows you to
instead write `x %>% f()`.

Packages in the tidyverse are designed around this pipe, which
semantically changes your code in a way that makes it more intuitive to
both read and write.

We use pipes when we want to chain a number of operations to manipulate
our data. For example,

    # Read in data using readr
    read_csv("market.csv") %>%
      # Create a new column called revenue using dplyr
      mutate(revenue = sales * price) %>%
      # Plot the data using ggplot2
      ggplot(aes(y = revenue, x = product)) + 
      geom_col()

You will be introduced to the functionality of these commands in this
chapter and in data visualization. So don't worry too much if you don't
know what does each of these command do.

The benefit of using pipes here is that we can add layers of operations
on top of one another. This is very useful when we are performing
complex operations on our data sets. The equivalent code for this
without the pipe would be:

``` {.r}
ggplot(
  mutate(
    read_csv("market.csv"), 
    revenue = sales * price
  ),
  aes(y = revenue, x = product)
) + 
  geom_col()
```

You can see how the pipe simplifies both our writing, reading, and
understanding of this sequence of code. It is much more natural to think
of the code first reading in the data, computing a new column called
revenue, and then plotting revenue over time with a column chart in
ggplot. The alternative reading (without pipes) is to plot the computed
revenue column of the read in data with a column chart.

All code in R can be written using a pipe, but in some circumstances it
doesn't make sense to do so. For example, mathematical notation is
typically written in a single line, rather than in a sequence of steps.
Suppose you had a numerical vector `x <- c(100, 200, 300)` and wanted to
do some mathematical calculations on it: `(log(x) + 3)^2`. The
equivalent code using pipes would be `x %>% log() %>% {.+3} %>% {.^2}` -
you first log the vector `x`, then add 3, and square the result. It
gives the same result, but is harder to read and write for this
circumstance.

``` {.r}
x <- c(100,200,300)
(log(x) + 3)^2
```

    ## [1] 57.83861 68.86207 75.75583

``` {.r}
x %>% log() %>% {.+3} %>% {.^2}
```

    ## [1] 57.83861 68.86207 75.75583

</exercise>

<exercise id="2" title="Introduction to dplyr" type="slides">

\<<slides source="chapter5_02_dplyr"> </slides>\>

</exercise>

<exercise id="3" title="Check Your Understanding on dplyr">

**Problem 1**

In this problem, we will use the `iris` data set. The `iris` dataset is
a built-in dataset in R that contains measurements on 4 different
attributes (in centimeters) for 50 flowers from 3 different species:
setosa, versicolor,virginica.

Create a new dataframe from the `iris` data set that meets the following
criteria: contains only the `Sepal.Length` column and a new column
called `petal_area` containing a value that approximates the area of the
petal. (`Petal.Length` times `Petal.Width`). Only the rows where
`petal_area` is greater than 5 should be shown in the final dataframe.
The final dataframe should be called `new_iris`.

You would want to perform the following tasks in this particular order:

(1) Add the new column called `petal_area`

(2) Filter the variable based on the condition stated above

(3) Select only the relevant variables in the final dataframe

<codeblock id="05_03_01">

Hint: You can use `mutate()`, `filter()` and `select()` to help with the
task.

</codeblock>

**Problem 2**

Consider the data sets `size` and `color`.

``` {.r}
size <- tibble(
  product_name = c('mini', 'pro', 'maxi'),
  diameter = c(23, 27, 32)
)

color <- tibble(
  product_name = c('mini','light', 'pro'),
  hue = c('red','green', 'silver')
)
```

We would like to merge the tables so that the result looks like:

    # A tibble: 4 × 3
      product_name hue    diameter
      <chr>        <chr>     <dbl>
    1 mini         red          23
    2 light        green        NA
    3 pro          silver       27
    4 maxi         NA           32

Which of the following commands does the operation?

<choice id=0.536885833600536>

<opt text="<code>inner_join(color, size)</code>" >

Try again!

</opt>

<opt text="<code>left_join(color, size)</code>" >

Try again!

</opt>

<opt text="<code>right_join(color, size)</code>" >

Try again!

</opt>

<opt text="<code>full_join(color, size)</code>" correct="true">

That's right!

</opt>

</choice>

</exercise>

<exercise id="4" title="Tidy (reshape) your data" type="slides">

\<<slides source="chapter5_04_tidyr"> </slides>\>

</exercise>

<exercise id="5" title="Check Your Understanding on tidyr" >

**Problem 1**

We have used `table1`, `table2` and `table3` as example in the slides.
Which table is tidy?

``` {.r}
table1
```

    ## # A tibble: 6 × 4
    ##   country      year  cases population
    ##   <chr>       <int>  <int>      <int>
    ## 1 Afghanistan  1999    745   19987071
    ## 2 Afghanistan  2000   2666   20595360
    ## 3 Brazil       1999  37737  172006362
    ## 4 Brazil       2000  80488  174504898
    ## 5 China        1999 212258 1272915272
    ## 6 China        2000 213766 1280428583

``` {.r}
table2
```

    ## # A tibble: 12 × 4
    ##    country      year type            count
    ##    <chr>       <int> <chr>           <int>
    ##  1 Afghanistan  1999 cases             745
    ##  2 Afghanistan  1999 population   19987071
    ##  3 Afghanistan  2000 cases            2666
    ##  4 Afghanistan  2000 population   20595360
    ##  5 Brazil       1999 cases           37737
    ##  6 Brazil       1999 population  172006362
    ##  7 Brazil       2000 cases           80488
    ##  8 Brazil       2000 population  174504898
    ##  9 China        1999 cases          212258
    ## 10 China        1999 population 1272915272
    ## 11 China        2000 cases          213766
    ## 12 China        2000 population 1280428583

``` {.r}
table3
```

    ## # A tibble: 6 × 3
    ##   country      year rate             
    ## * <chr>       <int> <chr>            
    ## 1 Afghanistan  1999 745/19987071     
    ## 2 Afghanistan  2000 2666/20595360    
    ## 3 Brazil       1999 37737/172006362  
    ## 4 Brazil       2000 80488/174504898  
    ## 5 China        1999 212258/1272915272
    ## 6 China        2000 213766/1280428583

<choice id=0.771973018301651>

<opt text="Table 1 only" correct="true">

That's correct!

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
two variables under the same column 'type'.

</opt>

</choice>

**Problem 2**

Consider the following simple table `smoke`, which command do I need to
transform `smoke` to `smoke2`?

``` {.r}
smoke <- tribble(
  ~smoke, ~employed, ~unemployed,
  "yes", 23, 10,
  "no", 20, 12
)
```

    smoke2
    # A tibble: 4 × 3
      smoke employment_status count
      <chr> <chr>             <dbl>
    1 yes   employed             23
    2 yes   unemployed           10
    3 no    employed             20
    4 no    unemployed           12

<choice id=0.221865599276498>

<opt text="Using <code>pivot_wider()</code> on smoke" >

Try again!

</opt>

<opt text="Using <code>pivot_longer()</code> on smoke" correct="true">

That's correct!

</opt>

<opt text="Using <code>select()</code> on smoke" >

Try again!

</opt>

<opt text="Using <code>filter()</code> on smoke" >

Try again!

</opt>

</choice>

**Problem 3**

Which of the following is an appropriate way to check if there are
missing observations in your data?

<choice id=0.715103336144239>

<opt text="Eyeballing and look for blanks in my data" >

That's not very effective nor efficient. Use R command to help you!

</opt>

<opt text="Eyeballing and look for <code>NA</code> in my data" >

That's not very effective nor efficient. Use R command to help you!

</opt>

<opt text="Using <code> is.na() </code> on my data" correct="true">

That's correct!

</opt>

<opt text="There is no need to find the missing values. We can ignore them." >

That's incorrect.

</opt>

</choice>

**Congratulations! This is the end of Data Wrangling!**

Here is a useful cheat sheet from the RStudio with commands that we
introduced and many more:
<https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf>
</exercise>
