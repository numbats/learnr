---
title: 'Chapter 6: Data Wrangling'
description:
  'In this chapter, you will learn to use tidyr and dplyr from the tidyverse in R.'
prev: null
next: /chapter7
type: chapter
id: 6
---

<exercise id="1" title="Introduction to tidyverse">

The tidyverse is a powerful collection of R packages that transform and visualize data. This chapter focuses on two packages **tidyr** and **dplyr**. **tidyr** helps you to create tidy data or data where each variable is in a column, each observation is a row and each value is a cell. **dplyr** is used for grammar of data manipulation. You can use it to solve the most common data manipulation challenges.

You can install the complete tidyverse with:
`install.packages("tidyverse")`

Then, to load the package:

```r
library(tidyverse)
```

## Tidy (reshape) your data
Raw data that we acquired can often be messy and complicated. The tidyr package allows you to wrangle messy datasets into nice and tidy ones.

A tidy data format has a rectangular shape which means it has columns, rows, and cells, just like in a spreadsheet. Each column should hold a single variable, each row should hold a single observation and each cell should hold a single value.

The example below shows the same information (country, year, population, and number of cases) organised in 3 different ways.
Examine each of the table.

```r
table1
```

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
```

```r
table2
```

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
```

```r
table3
```

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
```

Which table is tidy?
<choice> <opt text="Table 1 only" correct="true">

Good job!

</opt>

<opt text="Table 3 only">

This is not a correct answer.

</opt>

<opt text="Table 1 and 3">

This is not a correct answer.

</opt> 

<opt text="Table 2 and 3">

This is not a correct answer.

</opt>

</choice>

Sometimes raw data may have multiple variables or multiple values (not the same variable) in the same column, or sometimes you may want to merge multiple columns into one. Here are a few commands that can be helpful in manupulating the data into a tidy format:

- `separate()`: separating multiple variables in one column to different columns
- `unite()`: merging multiple columns into one, inserting underscore `_` as a separator between the two inputs.
- `separate_rows()`: separating multiple observations in the same cell. We pass the messy column name and a string to use as a separator.

In table 3, the `rate` column contains both the number of cases and the size of the populations.
We want to separate the `rate` variable into variables `cases` and `population`. 


```r
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE)
```

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
```
The `into` argument expects a vector of column names. The `sep` argument expects the non-alphanumeric character (a charater that is not a letter or a number) that we split upon. The `convert` argument is set to TRUE here so that R will try and convert to better types after the split.


In table 5, the `century` and `year` column can be combined to give a `year_new` column.
The `sep` argument here is what comes in between the values from different columns. If we don't want anything in between, we can use "".


```r
table5 %>%
  unite(new_year,century, year, sep = "")
```

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
```

In table 6, there are multiple observations in the same cell in each row of `year` and `cases`. We would like to separate them.

```r
table6 <- tibble(
  country = c("Afghanistan", "Brazil", "China"),
  year = c("1999,2000", "1999,2000", "1999,2000"),
  cases= c("745,2666", "37737,80488", "212258,213766")
)

table6 %>%
  separate_rows(cases, year, sep=',', convert = TRUE)
```

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
```


## Missing values

There are various ways to handle missing values (the NAs) in your data set. Tidyr has three functions:

- `fill()`: fill the missing values using the last observation carried forward. It has a `.direction` argument that you can pass `up` or `down`.
- `drop_na()`: drop the rows with observations that are `NA`
- `replace_na()`: replace the `NA` with specific values

Let's look at this toy data set. We will start with the `fill()` function to impute the `return` column in the `up` direction, then we will impute in the `down` direction. Can you spot the difference?


```r
apple <- tibble(
  year   = c(2020, 2020, 2020, 2020, 2021, 2021, 2021),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(0.75, 0.39, 0.34,   NA, 0.99, 0.07, 1.88)
)

apple %>%
  fill(return, .direction = "up")
```

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
```

```r
apple %>%
  fill(return, .direction = "down")
```

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
```


Then, we will try to drop the NAs in the return in `apple`.


```r
apple %>%
  drop_na(return)
```

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
```
 
Finally, we will also replace the NAs with the value `999`.

```r
apple %>%
  replace_na(list(return=999))
```

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
```

## Pivoting

Two common problems in raw data set:
- some of the column names are not really names of variables, but **values** of a variable. 
- when an observation is scattered across multiple rows.

To tackle these problems, you will need `pivot_longer()` and/or `pivot_wider()`

**pivot_longer()**

`table4a` is a great example of data that needs `pivot_longer()`. Here you see that the case count of each country is separated into two columns because they are from different years.

```r
table4a
```

```
## # A tibble: 3 × 3
##   country     `1999` `2000`
## * <chr>        <int>  <int>
## 1 Afghanistan    745   2666
## 2 Brazil       37737  80488
## 3 China       212258 213766
```

The first argument is the vector of column names that are actually values not variables.
The second argument is the name of the variable to move the column **names** to.
The third argument is the name of the variable to move the column **values** to.


```r
table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
```

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
```

**pivot_wider()**

In table 2, each observation is a certain country in a certain year. However, the observation is spread across two rows since there are `cases` and `population`.


```r
table2
```

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
```

The first argument is the column to take variable **names** from, which is `type`.
The second argument is the column to take variable **values** from, where is `count`.


```r
table2 %>%
  pivot_wider(names_from = type, values_from = count)
```

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
```
</exercise>

<exercise id="2" title="Introduction to dplyr">
`dplyr` provides a selection of tools for the most common data wrangling tasks.

## Data Transformation and Aggregation
There are a bunch of useful commands to transform and aggregate data in R.

- `select()`: pick particular variables from your data.

```r
table1 %>%
  select(country)
```

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
```
- `filter()`: extract observations from the data based on a given condition

```r
table2 %>%
  filter(year==1999)
```

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
```
- `arrange()`: sort your data based on one or more variables

```r
table2 %>%
  arrange(count)
```

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
```
- `mutate()`: add new variables or change existing variables

```r
table1 %>%
  mutate(rate = cases/population)
```

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
```

- `group_by()` and `ungroup()`: takes existing data and groups specific variables together for future operations. These two functions are often used together with other `dplyr` functions. We will introduce them with the `summarize()` function. The `summarize()` function creates a new dataframe based on the argument provided.


```r
table2 %>% group_by(type) %>% summarize(min = min(count), max =max(count))
```

```
## # A tibble: 2 × 3
##   type            min        max
##   <chr>         <int>      <int>
## 1 cases           745     213766
## 2 population 19987071 1280428583
```

You can summarize the data in different ways based on the groupings and different argument you included.

```r
table2 %>% group_by(type) %>% summarize(mean(count), median(count),sd(count))
```

```
## # A tibble: 2 × 4
##   type       `mean(count)` `median(count)` `sd(count)`
##   <chr>              <dbl>           <dbl>       <dbl>
## 1 cases             91277.          59112.      98662.
## 2 population    490072924.      173255630   613130267.
```


- `count()`: a convenient way to get a sense of the distribution of values in a data set.

```r
table2 %>% count(country)
```

```
## # A tibble: 3 × 2
##   country         n
##   <chr>       <int>
## 1 Afghanistan     4
## 2 Brazil          4
## 3 China           4
```

## Joining Datasets

Often you will need information from multiple datasets in your data analysis. It is important to learn different types of joins to accommodate different needs in your tasks.

We are going to use the following tables in our example. Consider there are 4 students in a class and they submitted homework 1 and homework 2. The tables contains their scores for the homeworks (gradebook) and not everyone submitted their homework during the semester.

```r
homework1 <- tibble(name = c('Alphonso', 'Daisy', 'Philip'), student_no = c(456,100,102), marks = c(80, 65, 34))
homework2 <- tibble(name = c('Alphonso', 'Philip', 'Melinda'), student_no = c(456,102,432), marks = c(85, 97, 56))
```

### Mutating Joins
Mutation joins return a copy of the dataset that has been augmented.

**Inner Join**

Inner joins retain only rows that exists on both datasets.

```r
inner_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 2 × 4
##   name     student_no marks.x marks.y
##   <chr>         <dbl>   <dbl>   <dbl>
## 1 Alphonso        456      80      85
## 2 Philip          102      34      97
```
When we perform inner join by `name` and `student_no`, R only returns rows that exists in both data set. When we do inner join with our `homework1` and `homework2` gradebooks, only `Alphonso` and `Philip` 's marks will show up since they are the only ones that submitted both homeworks.

**Left Join**

Left joins starts with the left data set (`homework1`) and search in the right data set looking for the same values of `name` and `student_no` to add to the left data set. 

```r
left_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 3 × 4
##   name     student_no marks.x marks.y
##   <chr>         <dbl>   <dbl>   <dbl>
## 1 Alphonso        456      80      85
## 2 Daisy           100      65      NA
## 3 Philip          102      34      97
```
When we do left join with our `homework1` and `homework2` gradebooks, we will only consider those students who submitted homework 1 and look for their marks in homework 2. Melinda's result will not be included in the join even though she has submitted her homework 2, while Daisy will have `NA` showing as the missing value.

**Right Join**

Right joins starts with the right data set (homework2) and search in the left data set looking for the same values of `name` and `student_no` to add to the right data set.

```r
right_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 3 × 4
##   name     student_no marks.x marks.y
##   <chr>         <dbl>   <dbl>   <dbl>
## 1 Alphonso        456      80      85
## 2 Philip          102      34      97
## 3 Melinda         432      NA      56
```
When we do right join with our `homework1` and `homework2` gradebooks, we will only consider those students who submitted homework 2 and look for their marks in homework 1. Daisy's result will not be included in the join even though she has submitted her homework 1, while Melinda will have `NA` showing as the missing value.


**Full Join**
Full joins retain all rows.

```r
full_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 4 × 4
##   name     student_no marks.x marks.y
##   <chr>         <dbl>   <dbl>   <dbl>
## 1 Alphonso        456      80      85
## 2 Daisy           100      65      NA
## 3 Philip          102      34      97
## 4 Melinda         432      NA      56
```
All the submissions with the corresponding mark are included in the full join of the gradebook.

### Filtering Joins
Filtering joins return a copy of the dataset that has been filtered.

**Semi Join**
The semi join returns a filtered version of the left data set based on matching entries in the right data set.

```r
semi_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 2 × 3
##   name     student_no marks
##   <chr>         <dbl> <dbl>
## 1 Alphonso        456    80
## 2 Philip          102    34
```

```r
semi_join(homework2, homework1, by = c('name','student_no'))
```

```
## # A tibble: 2 × 3
##   name     student_no marks
##   <chr>         <dbl> <dbl>
## 1 Alphonso        456    85
## 2 Philip          102    97
```

**Anti Join**
Now, let's say we want to know who didn't submit homeworks. The anti join will return the rows in the left data set that doesn't have an entry in the right data set.

```r
anti_join(homework1, homework2, by = c('name','student_no'))
```

```
## # A tibble: 1 × 3
##   name  student_no marks
##   <chr>      <dbl> <dbl>
## 1 Daisy        100    65
```

```r
anti_join(homework2, homework1, by = c('name','student_no'))
```

```
## # A tibble: 1 × 3
##   name    student_no marks
##   <chr>        <dbl> <dbl>
## 1 Melinda        432    56
```


</exercise>



