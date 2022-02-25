---
title: Introduction to dplyr
type: slides

---
## Data Transformation and Aggregation

`dplyr` provides a selection of tools for the most common data wrangling
tasks. We will start with introducing a few simple yet handy functions.

-   `select()` and an array of selection helpers
-   `filter()`
-   `arrange()`
-   `mutate()`
-   `group_by()` and `ungroup()`
-   `count()`
-   `case_when()`

Note:

This is a very big topic and we will not be able to cover **all** the
useful commands in this chapter. Please feel free to research online
other useful commands from `dplyr`.

---

-   `select()`: pick particular variables from your data.

``` r
table1 %>%
  select(country)
```

    ## # A tibble: 6 × 1
    ##   country    
    ##   <chr>      
    ## 1 Afghanistan
    ## 2 Afghanistan
    ## 3 Brazil     
    ## 4 Brazil     
    ## 5 China      
    ## 6 China

Note:

There are a bunch of useful commands to transform and aggregate data in
R. We will use inbuilt data sets: `table1`, `table2`, `table5` and
`billboard` for demonstration.

---

### Selection helpers

-   `starts_with()`: select all variables that start with a prefix.

``` r
billboard %>% select(starts_with("wk"))
```

    ## # A tibble: 317 × 76
    ##      wk1   wk2   wk3   wk4   wk5   wk6   wk7   wk8   wk9  wk10  wk11  wk12  wk13
    ##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1    87    82    72    77    87    94    99    NA    NA    NA    NA    NA    NA
    ##  2    91    87    92    NA    NA    NA    NA    NA    NA    NA    NA    NA    NA
    ##  3    81    70    68    67    66    57    54    53    51    51    51    51    47
    ##  4    76    76    72    69    67    65    55    59    62    61    61    59    61
    ##  5    57    34    25    17    17    31    36    49    53    57    64    70    75
    ##  6    51    39    34    26    26    19     2     2     3     6     7    22    29
    ##  7    97    97    96    95   100    NA    NA    NA    NA    NA    NA    NA    NA
    ##  8    84    62    51    41    38    35    35    38    38    36    37    37    38
    ##  9    59    53    38    28    21    18    16    14    12    10     9     8     6
    ## 10    76    76    74    69    68    67    61    58    57    59    66    68    61
    ## # … with 307 more rows, and 63 more variables: wk14 <dbl>, wk15 <dbl>,
    ## #   wk16 <dbl>, wk17 <dbl>, wk18 <dbl>, wk19 <dbl>, wk20 <dbl>, wk21 <dbl>,
    ## #   wk22 <dbl>, wk23 <dbl>, wk24 <dbl>, wk25 <dbl>, wk26 <dbl>, wk27 <dbl>,
    ## #   wk28 <dbl>, wk29 <dbl>, wk30 <dbl>, wk31 <dbl>, wk32 <dbl>, wk33 <dbl>,
    ## #   wk34 <dbl>, wk35 <dbl>, wk36 <dbl>, wk37 <dbl>, wk38 <dbl>, wk39 <dbl>,
    ## #   wk40 <dbl>, wk41 <dbl>, wk42 <dbl>, wk43 <dbl>, wk44 <dbl>, wk45 <dbl>,
    ## #   wk46 <dbl>, wk47 <dbl>, wk48 <dbl>, wk49 <dbl>, wk50 <dbl>, wk51 <dbl>, …

Note:

In addition, you can use **selection helpers**. These helpers select
variables by matching patterns in their names.

---

-   `ends_with()`: select all variables that end with a suffix.

``` r
billboard %>% select(ends_with("9"))
```

    ## # A tibble: 317 × 7
    ##      wk9  wk19  wk29  wk39  wk49  wk59 wk69 
    ##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <lgl>
    ##  1    NA    NA    NA    NA    NA    NA NA   
    ##  2    NA    NA    NA    NA    NA    NA NA   
    ##  3    51    18     4     9    28    NA NA   
    ##  4    62    73    NA    NA    NA    NA NA   
    ##  5    53    NA    NA    NA    NA    NA NA   
    ##  6     3    93    NA    NA    NA    NA NA   
    ##  7    NA    NA    NA    NA    NA    NA NA   
    ##  8    38    83    NA    NA    NA    NA NA   
    ##  9    12     3    22    NA    NA    NA NA   
    ## 10    57    79    NA    NA    NA    NA NA   
    ## # … with 307 more rows

Note:

In addition, you can use **selection helpers**. These helpers select
variables by matching patterns in their names.

---

-   `contains()`: select all variables that contains a literal string.

``` r
table5 %>% select(contains('ry'))
```

    ## # A tibble: 6 × 2
    ##   country     century
    ##   <chr>       <chr>  
    ## 1 Afghanistan 19     
    ## 2 Afghanistan 20     
    ## 3 Brazil      19     
    ## 4 Brazil      20     
    ## 5 China       19     
    ## 6 China       20

Note:

In addition, you can use **selection helpers**. These helpers select
variables by matching patterns in their names.

---

-   `num_range()`: select all variables that matches a numerical range
    like x01, x02, x03.

``` r
billboard %>% select(num_range("wk", 10:15))
```

    ## # A tibble: 317 × 6
    ##     wk10  wk11  wk12  wk13  wk14  wk15
    ##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1    NA    NA    NA    NA    NA    NA
    ##  2    NA    NA    NA    NA    NA    NA
    ##  3    51    51    51    47    44    38
    ##  4    61    61    59    61    66    72
    ##  5    57    64    70    75    76    78
    ##  6     6     7    22    29    36    47
    ##  7    NA    NA    NA    NA    NA    NA
    ##  8    36    37    37    38    49    61
    ##  9    10     9     8     6     1     2
    ## 10    59    66    68    61    67    59
    ## # … with 307 more rows

Note:

In addition, you can use **selection helpers**. These helpers select
variables by matching patterns in their names.

---

You can also filter the observations, re-arrange them and add new
variables.

-   `filter()`: extract observations from the data based on a given
    condition

``` r
table2 %>%
  filter(year==1999)
```

    ## # A tibble: 6 × 4
    ##   country      year type            count
    ##   <chr>       <int> <chr>           <int>
    ## 1 Afghanistan  1999 cases             745
    ## 2 Afghanistan  1999 population   19987071
    ## 3 Brazil       1999 cases           37737
    ## 4 Brazil       1999 population  172006362
    ## 5 China        1999 cases          212258
    ## 6 China        1999 population 1272915272

---

-   `arrange()`: sort your data based on one or more variables

``` r
table2 %>%
  arrange(count)
```

    ## # A tibble: 12 × 4
    ##    country      year type            count
    ##    <chr>       <int> <chr>           <int>
    ##  1 Afghanistan  1999 cases             745
    ##  2 Afghanistan  2000 cases            2666
    ##  3 Brazil       1999 cases           37737
    ##  4 Brazil       2000 cases           80488
    ##  5 China        1999 cases          212258
    ##  6 China        2000 cases          213766
    ##  7 Afghanistan  1999 population   19987071
    ##  8 Afghanistan  2000 population   20595360
    ##  9 Brazil       1999 population  172006362
    ## 10 Brazil       2000 population  174504898
    ## 11 China        1999 population 1272915272
    ## 12 China        2000 population 1280428583

---

-   `mutate()`: add new variables or change existing variables

``` r
table1 %>%
  mutate(rate = cases/population)
```

    ## # A tibble: 6 × 5
    ##   country      year  cases population      rate
    ##   <chr>       <int>  <int>      <int>     <dbl>
    ## 1 Afghanistan  1999    745   19987071 0.0000373
    ## 2 Afghanistan  2000   2666   20595360 0.000129 
    ## 3 Brazil       1999  37737  172006362 0.000219 
    ## 4 Brazil       2000  80488  174504898 0.000461 
    ## 5 China        1999 212258 1272915272 0.000167 
    ## 6 China        2000 213766 1280428583 0.000167

---

-   `group_by()` and `ungroup()`: takes existing data and groups
    specific variables together for future operations.

``` r
table2 %>% 
  group_by(type) %>% 
  summarize(min = min(count), max =max(count))
```

    ## # A tibble: 2 × 3
    ##   type            min        max
    ##   <chr>         <int>      <int>
    ## 1 cases           745     213766
    ## 2 population 19987071 1280428583

Note:

These two functions are often used together with other `dplyr`
functions. We will introduce them with the `summarize()` function. The
`summarize()` function creates a new dataframe based on the argument
provided.

---

You can summarize the data in different ways based on the groupings and
different argument you included.

``` r
table2 %>% 
  group_by(type) %>% 
  summarize(mean(count), median(count),sd(count))
```

    ## # A tibble: 2 × 4
    ##   type       `mean(count)` `median(count)` `sd(count)`
    ##   <chr>              <dbl>           <dbl>       <dbl>
    ## 1 cases             91277.          59112.      98662.
    ## 2 population    490072924.      173255630   613130267.

Note:

These two functions are often used together with other `dplyr`
functions. We will introduce them with the `summarize()` function. The
`summarize()` function creates a new dataframe based on the argument
provided.

---

-   `count()`: a convenient way to get a sense of the distribution of
    values in a data set.

``` r
table2 %>% count(country)
```

    ## # A tibble: 3 × 2
    ##   country         n
    ##   <chr>       <int>
    ## 1 Afghanistan     4
    ## 2 Brazil          4
    ## 3 China           4

---

-   `case_when()`: This command takes multiple conditions and tests them
    in order.

``` r
table1 %>% 
  mutate(band = case_when(cases>= 1000 & cases <=100000~ "Medium",
                          cases > 100000 ~ "High",
                          TRUE ~ "Low"))
```

    ## # A tibble: 6 × 5
    ##   country      year  cases population band  
    ##   <chr>       <int>  <int>      <int> <chr> 
    ## 1 Afghanistan  1999    745   19987071 Low   
    ## 2 Afghanistan  2000   2666   20595360 Medium
    ## 3 Brazil       1999  37737  172006362 Medium
    ## 4 Brazil       2000  80488  174504898 Medium
    ## 5 China        1999 212258 1272915272 High  
    ## 6 China        2000 213766 1280428583 High

Note:

For `case_when()`, you should order the tests from specific to general,
and keep track of how those ambiguous rows are being treated. `TRUE`
here is equivalent to the `else` statement.

---

## Joining Datasets

We are going to use the following tables in our example.

``` r
homework1 <- tibble(name = c('Alphonso', 'Daisy', 'Philip'), 
                    student_no = c(456,100,102), marks = c(80, 65, 34))
homework2 <- tibble(name = c('Alphonso', 'Philip', 'Melinda'), 
                    student_no = c(456,102,432), marks = c(85, 97, 56))
```

Note:

Often you will need information from multiple datasets in your data
analysis. It is important to learn different types of joins to
accommodate different needs in your tasks.

We are going to use the following tables in our example. Consider there
are 4 students in a class and they submitted homework 1 and homework 2.
The tables contains their scores for the homeworks (gradebook) and not
everyone submitted their homework during the semester.

---

### Mutating Joins

Mutation joins return a copy of the dataset that has been augmented.

---

**Inner Join**

Inner joins retain only rows that exists on both datasets.

``` r
inner_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 2 × 4
    ##   name     student_no marks.x marks.y
    ##   <chr>         <dbl>   <dbl>   <dbl>
    ## 1 Alphonso        456      80      85
    ## 2 Philip          102      34      97

Note:

When we perform inner join by `name` and `student_no`, R only returns
rows that exists in both data set. When we do inner join with our
`homework1` and `homework2` gradebooks, only `Alphonso` and `Philip` 's
marks will show up since they are the only ones that submitted both
homeworks.

---

**Left Join**

Left joins starts with the left data set (`homework1`) and search in the
right data set looking for the same values of `name` and `student_no` to
add to the left data set.

``` r
left_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 3 × 4
    ##   name     student_no marks.x marks.y
    ##   <chr>         <dbl>   <dbl>   <dbl>
    ## 1 Alphonso        456      80      85
    ## 2 Daisy           100      65      NA
    ## 3 Philip          102      34      97

Note:

When we do left join with our `homework1` and `homework2` gradebooks, we
will only consider those students who submitted homework 1 and look for
their marks in homework 2. Melinda's result will not be included in the
join even though she has submitted her homework 2, while Daisy will have
`NA` showing as the missing value.

---

**Right Join**

Right joins starts with the right data set (homework2) and search in the
left data set looking for the same values of `name` and `student_no` to
add to the right data set.

``` r
right_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 3 × 4
    ##   name     student_no marks.x marks.y
    ##   <chr>         <dbl>   <dbl>   <dbl>
    ## 1 Alphonso        456      80      85
    ## 2 Philip          102      34      97
    ## 3 Melinda         432      NA      56

Note:

When we do right join with our `homework1` and `homework2` gradebooks,
we will only consider those students who submitted homework 2 and look
for their marks in homework 1. Daisy's result will not be included in
the join even though she has submitted her homework 1, while Melinda
will have `NA` showing as the missing value.

---

**Full Join**

Full joins retain all rows.

``` r
full_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 4 × 4
    ##   name     student_no marks.x marks.y
    ##   <chr>         <dbl>   <dbl>   <dbl>
    ## 1 Alphonso        456      80      85
    ## 2 Daisy           100      65      NA
    ## 3 Philip          102      34      97
    ## 4 Melinda         432      NA      56

All the submissions with the corresponding mark are included in the full
join of the gradebook.

---

### Filtering Joins

Filtering joins return a copy of the dataset that has been filtered.

---

**Semi Join**

The semi join returns a filtered version of the left data set based on
matching entries in the right data set.

``` r
semi_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 2 × 3
    ##   name     student_no marks
    ##   <chr>         <dbl> <dbl>
    ## 1 Alphonso        456    80
    ## 2 Philip          102    34

``` r
semi_join(homework2, homework1, by = c('name','student_no'))
```

    ## # A tibble: 2 × 3
    ##   name     student_no marks
    ##   <chr>         <dbl> <dbl>
    ## 1 Alphonso        456    85
    ## 2 Philip          102    97

---

**Anti Join**

Now, let's say we want to know who didn't submit homeworks. The anti
join will return the rows in the left data set that doesn't have an
entry in the right data set.

``` r
anti_join(homework1, homework2, by = c('name','student_no'))
```

    ## # A tibble: 1 × 3
    ##   name  student_no marks
    ##   <chr>      <dbl> <dbl>
    ## 1 Daisy        100    65

``` r
anti_join(homework2, homework1, by = c('name','student_no'))
```

    ## # A tibble: 1 × 3
    ##   name    student_no marks
    ##   <chr>        <dbl> <dbl>
    ## 1 Melinda        432    56
