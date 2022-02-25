---
title: 'Chapter 5: Data wrangling'
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

Tidyverse includes the following packages:

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

``` r
library(tidyverse)
```

You can also load specific library separately, for example,
`library(dplyr)`.

**Pipes**

`%>%` is a "pipe"-like operator with which you may pipe a value forward
into an expression or function call; something along the lines of
`x %>% f`, rather than `f(x)`. It semantically changes your code in a
way that makes it more intuitive to both read and write. To illustrate
the idea, below is a simplified example with mathematical opeations:

``` r
x <- c(100,200,300)
x %>% log() %>%
    +3 %>%
    exp()
```

    ## [1] 2008.554 4017.107 6025.661

We start with a vector `x`. From there, we take log every element of,
then we add 3 to each element. Finally we compute the exponential of
each element of x. Note how the code is arranged in the logical order of
how you think about the task: x - \> take log -\> add 3 -\> exponential,
which is also the same order as the code will execute. It's like a
recipe -- easy to read, easy to follow!

In practice, we don't usually write a sequence of mathematical
operations using pipes. (Because you could have just typed
`exp(log(x) + 3)`.

Rather, we use pipes when we want to chain a number of operations to
manipulate our data. For example,

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
complex operations on our data sets.

We will start using pipes in the exercises.

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

``` r
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

<choice id=0.238996259402484>

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

<choice id=0.567945376737043>

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

``` r
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

<choice id=0.0499558339361101>

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

<choice id=0.0521996046882123>

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
