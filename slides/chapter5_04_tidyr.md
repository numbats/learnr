---
title: Tidy your data
type: slides

---
## Tidy (reshape) your data

A tidy data format:

-   Each column should hold a single variable
-   each row should hold a single observation
-   each cell should hold a single value.

Examine `table1`, `table2`, `table3` and `Table5`.

They show the same information in 4 different ways.

---

Table 1

``` r
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

Note:

Raw data that we acquired can often be messy and complicated. The tidyr
package allows you to wrangle messy datasets into nice and tidy ones.

A tidy data format has a rectangular shape which means it has columns,
rows, and cells, just like in a spreadsheet. Each column should hold a
single variable, each row should hold a single observation and each cell
should hold a single value.

The example on the left shows the same information (country, year,
population, and number of cases) organised in 3 different ways. Examine
each of the table.

---

Table 2

``` r
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

Note:

Raw data that we acquired can often be messy and complicated. The tidyr
package allows you to wrangle messy datasets into nice and tidy ones.

A tidy data format has a rectangular shape which means it has columns,
rows, and cells, just like in a spreadsheet. Each column should hold a
single variable, each row should hold a single observation and each cell
should hold a single value.

The example on the left shows the same information (country, year,
population, and number of cases) organised in 3 different ways. Examine
each of the table.

---

Table 3

``` r
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

Note:

Raw data that we acquired can often be messy and complicated. The tidyr
package allows you to wrangle messy datasets into nice and tidy ones.

A tidy data format has a rectangular shape which means it has columns,
rows, and cells, just like in a spreadsheet. Each column should hold a
single variable, each row should hold a single observation and each cell
should hold a single value.

The example below shows the same information (country, year, population,
and number of cases) organised in 3 different ways. Examine each of the
table.

---

Table 5

``` r
table5
```

    ## # A tibble: 6 × 4
    ##   country     century year  rate             
    ## * <chr>       <chr>   <chr> <chr>            
    ## 1 Afghanistan 19      99    745/19987071     
    ## 2 Afghanistan 20      00    2666/20595360    
    ## 3 Brazil      19      99    37737/172006362  
    ## 4 Brazil      20      00    80488/174504898  
    ## 5 China       19      99    212258/1272915272
    ## 6 China       20      00    213766/1280428583

Note:

Raw data that we acquired can often be messy and complicated. The tidyr
package allows you to wrangle messy datasets into nice and tidy ones.

A tidy data format has a rectangular shape which means it has columns,
rows, and cells, just like in a spreadsheet. Each column should hold a
single variable, each row should hold a single observation and each cell
should hold a single value.

The example below shows the same information (country, year, population,
and number of cases) organised in 3 different ways. Examine each of the
table.

---

R functions to tidy the data:

-   `separate()`: separating multiple variables in one column to
    different columns.
-   `unite()`: merging multiple columns into one, inserting underscore
    (`_`) as a separator between the two inputs.
-   `separate_rows()`: separating multiple observations in the same
    cell. We pass the messy column name and a string to use as a
    separator.

Note:

Sometimes raw data may have multiple variables or multiple values (not
the same variable) in the same column, or sometimes you may want to
merge multiple columns into one. Here are a few commands that can be
helpful in manipulating the data into a tidy format.

---

In table 3, the `rate` column contains both the number of cases and the
size of the populations.

We want to separate the `rate` variable into variables `cases` and
`population`.

``` r
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE)
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

Note:

-   The `into` argument expects a vector of column names.
-   The `sep` argument expects the non-alphanumeric character (a
    character that is not a letter or a number) that we split upon.
-   The `convert` argument is set to TRUE here so that R will try and
    convert to better types after the split.

---

In table 5, the `century` and `year` column can be combined to give a
`year_new` column.

``` r
table5 %>%
  unite(new_year,century, year, sep = "")
```

    ## # A tibble: 6 × 3
    ##   country     new_year rate             
    ##   <chr>       <chr>    <chr>            
    ## 1 Afghanistan 1999     745/19987071     
    ## 2 Afghanistan 2000     2666/20595360    
    ## 3 Brazil      1999     37737/172006362  
    ## 4 Brazil      2000     80488/174504898  
    ## 5 China       1999     212258/1272915272
    ## 6 China       2000     213766/1280428583

Note:

The `sep` argument here is what comes in between the values from
different columns. If we don't want anything in between, we can use "".

---

In table 6, there are multiple observations in the same cell in each row
of `year` and `cases`.

``` r
table6 <- tibble(country = c("Afghanistan", "Brazil", "China"),
  year = c("1999,2000", "1999,2000", "1999,2000"),
  cases= c("745,2666", "37737,80488", "212258,213766"))

table6
```

    ## # A tibble: 3 × 3
    ##   country     year      cases        
    ##   <chr>       <chr>     <chr>        
    ## 1 Afghanistan 1999,2000 745,2666     
    ## 2 Brazil      1999,2000 37737,80488  
    ## 3 China       1999,2000 212258,213766

---

We would like to separate them.

``` r
table6 %>% separate_rows(cases, year, sep=',', convert = TRUE)
```

    ## # A tibble: 6 × 3
    ##   country      year  cases
    ##   <chr>       <int>  <int>
    ## 1 Afghanistan  1999    745
    ## 2 Afghanistan  2000   2666
    ## 3 Brazil       1999  37737
    ## 4 Brazil       2000  80488
    ## 5 China        1999 212258
    ## 6 China        2000 213766

---

## Pivoting

Two common problems in raw data set:

-   some of the column names are not really names of variables, but
    **values** of a variable.
-   when an observation is scattered across multiple rows.

To tackle these problems, you will need `pivot_longer()` and/or
`pivot_wider()`

---

**pivot_longer()**

`table4a` is a great example of data that needs `pivot_longer()`.

Here you see that the case count of each country is separated into two
columns because they are from different years.

``` r
table4a
```

    ## # A tibble: 3 × 3
    ##   country     `1999` `2000`
    ## * <chr>        <int>  <int>
    ## 1 Afghanistan    745   2666
    ## 2 Brazil       37737  80488
    ## 3 China       212258 213766

``` r
table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
```

    ## # A tibble: 6 × 3
    ##   country     year   cases
    ##   <chr>       <chr>  <int>
    ## 1 Afghanistan 1999     745
    ## 2 Afghanistan 2000    2666
    ## 3 Brazil      1999   37737
    ## 4 Brazil      2000   80488
    ## 5 China       1999  212258
    ## 6 China       2000  213766

Notes:

-   The first argument is the vector of column names that are actually
    values not variables.
-   The second argument is the name of the variable to move the column
    **names** to.
-   The third argument is the name of the variable to move the column
    **values** to.

---

**pivot_wider()**

In table 2, each observation is a certain country in a certain year.

However, the observation is spread across two rows since there are
`cases` and `population`.

``` r
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

``` r
table2 %>%
  pivot_wider(names_from = type, values_from = count)
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

Notes:

-   The first argument is the column to take variable **names** from,
    which is `type`.
-   The second argument is the column to take variable **values** from,
    where is `count`.

---

## Missing values

There are various ways to handle missing values (the `NA`s) in your data
set.

Tidyr has three functions:

-   `fill()`: fill the missing values using the last observation carried
    forward. It has a `.direction` argument that you can pass `up` or
    `down`.
-   `drop_na()`: drop the rows with observations that are `NA`
-   `replace_na()`: replace the `NA` with specific values

---

Let's look at this toy data set.

We will start with the `fill()` function to impute the `return` column
in the `up` direction, then we will impute in the `down` direction.

Can you spot the difference?

``` r
apple <- tibble(
  year   = c(2020, 2020, 2020, 2020, 2021, 2021, 2021),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(0.75, 0.39, 0.34,   NA, 0.99, 0.07, 1.88)
)

apple %>%
  fill(return, .direction = "up")
```

    ## # A tibble: 7 × 3
    ##    year   qtr return
    ##   <dbl> <dbl>  <dbl>
    ## 1  2020     1   0.75
    ## 2  2020     2   0.39
    ## 3  2020     3   0.34
    ## 4  2020     4   0.99
    ## 5  2021     2   0.99
    ## 6  2021     3   0.07
    ## 7  2021     4   1.88

``` r
apple %>%
  fill(return, .direction = "down")
```

    ## # A tibble: 7 × 3
    ##    year   qtr return
    ##   <dbl> <dbl>  <dbl>
    ## 1  2020     1   0.75
    ## 2  2020     2   0.39
    ## 3  2020     3   0.34
    ## 4  2020     4   0.34
    ## 5  2021     2   0.99
    ## 6  2021     3   0.07
    ## 7  2021     4   1.88

---

Then, we will try to drop the `NA`s in the return in `apple`.

``` r
apple %>%
  drop_na(return)
```

    ## # A tibble: 6 × 3
    ##    year   qtr return
    ##   <dbl> <dbl>  <dbl>
    ## 1  2020     1   0.75
    ## 2  2020     2   0.39
    ## 3  2020     3   0.34
    ## 4  2021     2   0.99
    ## 5  2021     3   0.07
    ## 6  2021     4   1.88

---

Finally, we will also replace the `NA`s with the value `999`.

``` r
apple %>%
  replace_na(list(return=999))
```

    ## # A tibble: 7 × 3
    ##    year   qtr return
    ##   <dbl> <dbl>  <dbl>
    ## 1  2020     1   0.75
    ## 2  2020     2   0.39
    ## 3  2020     3   0.34
    ## 4  2020     4 999   
    ## 5  2021     2   0.99
    ## 6  2021     3   0.07
    ## 7  2021     4   1.88
