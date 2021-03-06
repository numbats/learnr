---
title: 'Chapter 2: R programming basics'
description: In R Programming Basics, you will master the basic operations of this
  popular open source language. You will also learn to perform simple algebraic operations
  on vectors and matrices. You will also learn about data frames, conditional statements,
  loops, and functions to power your R code, making your work more efficient and elegant.
prev: /chapter1
next: /chapter3
type: chapter
id: 2

---
<exercise id="1" title="Arithmetic and Variable Assignment">

## Arithmetic Operations

One of the simplest thing that you can do with R is to use it as a
calculator. Here are some common arithmetic operations:

-   Addition: `+`
-   Subtraction: `-`
-   Multiplication: `*`
-   Division: `/`
-   Exponentiation: `^`
-   Modulo: `%%`

The `^` operator raises the number to its left to the power of the
number to its right. For example, if you enter `2^3`, you will get the
answer of 2 to the power 3, which is 8.

The `%%` operator gives the remainder of the division of the number to
the left by the number on its right. For example, if you enter `7 %% 3`,
you will get the answer of 7 modulo 3 (7 = 3\*2 + 1), which is 1.

Note that you can add comment to your code using the `#` symbol. This is
helpful when you want to take notes as you go, so that you can follow
your R code when you come back to revise in a few weeks time!

## Variable Assignment

A basic concept in programming is called a variable. A variable allows
you to store a value (e.g. 8) or an object (e.g. a piece of string) in
R. You can then later use this variable's name to easily access the
value or the object that is stored within this variable.

We can **assign** the result of our arithmetic operations (which is a
value), for instance, `2^3` to a variable named `my_result` using the
following command: `my_result <- 2^3`

Now when you evaluate the value of the variable `my_reuslt`, you will
get the value of 8.

Now it's your turn to try variable assignment and some simple arithmetic
operations in R!

<codeblock id="02_01">

Hint: Let's say you would like to assign the result of summing from 1 to
5 to a variable named `sum_to_five`. You can do:
`sum_to_five <- 1+2+3+4+5`

Now if you would like to divide `sum_to_five` by 5 and assign the result
to `average`, you can do: `average <- sum_to_five/5`

</codeblock>

</exercise>

<exercise id="2" title="Basic Data Types in R">

## Basic Data Types in R

There are numerous data types in R. Here are some of the basic ones:

-   **numerics**: numerical values
-   **logical**: boolean values (`TRUE` or `FALSE`)
-   **characters**: String (a piece of text) like 'some text' or "some
    text". Note that we use quotation marks to indicate if a value is a
    string.

### Checking the data types

You can check the data type of a variable with the `class()` function.
This is a useful function since often you need matching data types when
you perform operations in R. For example, you will get an error message
if you try to evaluate `5 + "6"`.

### More on numerics: Integer vs Double

The two most common numeric classes are "integer" and "double" (for
double precision floating point numbers). "Integers" are whole numbers
like `7`. "Double" are decimal values like `5.217`. R uses double
precision numeric values by default.

``` {.r}
db_var <- 7
class(db_var)
```

    ## [1] "numeric"

To create integer values, you can add `L` after the number.

``` {.r}
int_var <- 7L
class(int_var)
```

    ## [1] "integer"

Now, it's your turn to play around with different variable types!

<codeblock id="02_02"> Hint: Replace the values in the R code with
values that are provided in the instructions (the line with the comment
`#`). For example, `weather <- "sunny"` assigns the string "sunny" to
the variable `weather`.

</codeblock>

## Missing Values

There are several special values in R, including `NA`, `NaN`, and `Inf`.

**NA**

`NA` (short for 'Not Available'), is a logical constant of length 1
which contains a missing value indicator. We use `NA` to replace an
entry of a vector when such value is unknown or missing. There are
different types of `NA` for different class, including `NA_integer_`,
`NA_real_`, `NA_complex_` and `NA_character_`. `NA_integer` is of the
integer class and so on.

Most operations on an `NA` becomes an `NA`. For instance,

``` {.r}
x <- c(1, 2, NA, 4)
sum(x)
```

    ## [1] NA

However, there is an exception - when we use the `paste()` function to
concatenate `NA` with other strings. The operation will be performed
with the `NA`.

``` {.r}
some_string <- c("Apple","Banana", NA, "Orange")
paste(some_string, " is good for you.")
```

    ## [1] "Apple  is good for you."  "Banana  is good for you."
    ## [3] "NA  is good for you."     "Orange  is good for you."

We can use `is.na()` to test if a values is `NA`. The function is.na(x)
returns a boolean vector of the same size as `x` with value TRUE if the
corresponding element in `x` is `NA`.

``` {.r}
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE

**NaN**

`NaN` (short for 'Not A Number') is for arithmetic purposes. `NaN`
usually comes from arithmetic operations that create undefined values
such as 0/0, hence `NaN` is numeric. You can also use `is.na()` to check
if a value is `NaN`.

``` {.r}
y <- c(4, 0/0, 3,5)
is.na(y)
```

    ## [1] FALSE  TRUE FALSE FALSE

**Inf**

`Inf` (short for `Infinite`), like `NaN`, also stems from numerical
operations and thus is of numeric class. It usually comes operations
like 1/0 where the result is a very very large number (larger than other
numeric). Note that `Inf` is not a type of `NA`. You can use
`is.infinite()` to check if a value is `Inf`.

``` {.r}
is.infinite(23/0)
```

    ## [1] TRUE

</exercise>

<exercise id='3' title='Vectors' type="slides">

<slides source="chapter2_03_vectors"> </slides>

</exercise>

<exercise id='4' title='Check Your Understanding on Vectors'>

**Problem 1**

Given the following vector `y` in R,

    y = c(2,4,6,8,1,3,5,7)

which of the following is the output of `y-2`?

<choice id=0.830610267817974>

<opt text="<code> 0  4  6  8  1  3  5  7 </code>" >

Try again! Check your calculation in R!

</opt>

<opt text="<code> 0  2  4  6 -1  1  3  5 </code>" correct="true">

That's correct!

</opt>

<opt text="<code> 2  4  6  8  1  3  5  7 -2 </code>" >

Try again! Check your calculation in R!

</opt>

<opt text="<code> -4  -8 -12 -16  -2  -6 -10 -14 </code>" >

Try again! Check your calculation in R!

</opt>

</choice>

**Problem 2**

Given the following vector `y` in R,

    y = c(2,4,6,8,1,3,5,7)

which of the following is the output of `y[4:7]`?

<choice id=0.138845026027411>

<opt text="<code> 8 1 3 5 </code>" correct="true">

That's correct!

</opt>

<opt text="<code> 8 1 3 </code>" >

Try again! Check your calculation in R!

</opt>

<opt text="<code> 6 8 1 3 </code>" >

Try again! Check your calculation in R!

</opt>

<opt text="<code> 1 3 5 </code>" >

Try again! Check your calculation in R!

</opt>

</choice>

</exercise>

<exercise id='5' title='Matrices' type = "slides">

<slides source="chapter2_05_matrices"> </slides>

</exercise>

<exercise id='6' title='Check Your Understanding on Matrices'>

Consider the following matrices S and T:

$$S = \\begin{bmatrix}1&0\\\\0&1\\end{bmatrix}, T = \\begin{bmatrix}2&2\\\\4&3\\end{bmatrix}$$

-   Construct a matrix M by stacking S on top of T. Assign your result
    to the variable `M_mat`.

-   Select a sub-matrix of M with the data on the rows 1, 2, 3 and
    columns 2. Assign the result to the variable `part_of_M`.

<codeblock id="02_06">

Hint 1: To stack one matrix on top of another, we can use the `rbind()`
command. Hint 2: For example, B\[1,2\] selects the element at the first
row and second column of matrix B. B\[1:3,2:4\] results in a matrix with
the data on the rows 1, 2, 3 and columns 2, 3, 4.

</codeblock>

</exercise>

<exercise id='7' title='Data Frames'>

## Data Frames

A data frame has the variables of a dataset as columns and the
observations as rows.

Let's look at an example. Just run the code and you will see what a data
frame looks like in R.

<codeblock id="02_07_01">

Hint: Just run the command!

</codeblock>

The iris data set gives the measurements in centimeters of the variables
sepal length, sepal width, petal length and petal width, respectively,
for 50 flowers from each of 3 species of iris. The species are Iris
setosa, versicolor, and virginica.

### Quick Look at the Data Frame

Often it is useful to show only a small part of the entire dataset,
especially when we are working with very big data set where showing the
entire dataset is not easy. Here are a few useful commands that helps
you understand the data frame very quickly.

-   `head()` shows the first few observations of a data frame.
-   `tail()` shows the last few observations of a data frame.
-   `str()` shows the structure of the dataset.

Investigate the structure of the example dataframe. Have a look at the
first and last few observations!

<codeblock id="02_07_02">

Hint: Try `head(df)`.

</codeblock>

**Answer the following question**

What is the data type of the variable 'dose'?

<choice id=0.906263957498595>

<opt text="numeric" correct="true">

That's correct!

</opt>

<opt text="string" >

Try again! Take a quick look at your data in R!

</opt>

<opt text="data frame" >

Try again! Data frame is a type of data structure, not a data type.

</opt>

<opt text="matrix" >

Try again! Matrix is a type of data structure, not a data type.

</opt>

</choice>

### Creating Data Frame

You can construct your own data frame using data that you have with the
`data.frame()` function. You can include different vectors as argument
in the function and they will become different columns of your data
frame. Note that you should make sure the vectors that you pass have
same length (i.e. same number of observations for each column).

**Let's practice!**

Create a data frame using vectors `symbol`, `element`, `chemical_group`
and `atomic_no`, following that order. Assign the result data frame to
`first_ten_elements`.

<codeblock id="02_07_03">

Hint: Use the `data.frame()` function on the vectors.

</codeblock>

### Indexing, Selecting Columns and Subset

Similar to vectors and matrices, you select elements from a data frame
using square brackets `[ ]`.

-   For example, if you would like to select row 2 to 4 and column 3 to
    5 from a data frame called `my_df`, you can do `my_df[2:4, 3:5]`.
-   When you want to select the entire first row of a data frame, you
    can use \`my_df\[1, \]
-   When you want to select the entire first column of a data frame, you
    can use `my_df[,1]`

Note that when you select a single column (e.g. `my_df[,1]`), it turns
into a vector. If you would like it to remain as a data frame, you can
use `my_df[, 1, drop = FALSE]`.

Alternatively, if you would like to select a certain variable from the
data frame, you can use the column name in the square bracket directly
or use `$` instead: `my_df[ , "column_name"]` or `my_df$column_name`.

### Sorting

Sometimes we may want to sort the data according to a certain variable
in the dataset. In R, we can use the `order()` function which gives the
ranked position of each element when it is applied on a variable. For
example,

``` {.r}
x <- c(100, -200,300)
order(x)
```

    ## [1] 2 1 3

The output above is the ranked positions and we can use that to sort the
vector `x`.

``` {.r}
x[order(x)]
```

    ## [1] -200  100  300

The above R code gives an ordered version of `x`.

Now that we know how to use the `order()`, let's sort the
first_ten_element data frame in ascending order of `atomic_no`, assign
the sorted dataframe to `sorted_df`.

<codeblock id="02_07_04">

Hint: Use `order(first_ten_elements$atomic_no)` to create positions.
Then, use 'positions' with square brackets: `first_ten_elements[...]`;
can you fill in the ...? Do not forget that 'positions' indicates the
order of the rows in the data frame.

</codeblock>

</exercise>

<exercise id='8' title='Conditional Statements' type="slides">

<slides source="chapter2_08_conditionalstatements"> </slides>

</exercise>

<exercise id='9' title='Check Your Understanding on Conditional Statements'>

Consider the following syntax:

    if (x < 50) {
      if (x < 20) {
        result <- "Low to None"
      } else {
        result <- "Low"
      }
    } else if (x == 100) {
      result <- "Full"
    } else {
      result <- "High"
    }
    print(result)

Take a look at the following statements:

(1) If `x` is set to 75, "High" gets printed to the console.

(2) If `x` is set to 18, "Low" gets printed to the console.

(3) If `x` is set to 100, R prints out "Full"

(4) If `x` is set to 21, "Low" gets printed to the console.

Select the option that lists **all** the true statements.

<choice id=0.588340152055025>

<opt text="(1) and (2)" >

Try again! Copy the code and try it with some numbers in R!

</opt>

<opt text="(1) and (3)" >

Try again! Copy the code and try it with some numbers in R!

</opt>

<opt text="(2) and (4)" >

Try again! Copy the code and try it with some numbers in R!

</opt>

<opt text="(1), (3), (4)" correct="true">

That's correct!

</opt>

</choice>

</exercise>

<exercise id='10' title='Loops'>

In data analytics, often we need to perform the same operation
repeatedly on the data and **loops** can come in handy on these
occasions. There are 2 types of loops: - The 'for loop' is designed to
iterate over all elements in a sequence - The 'while loop' is designed
to repeat the operations until certain condition is satisfied

## For loops

A simple for loop in R looks like this:

``` {.r}
sequence <- c(1,3,5)
for (i in sequence) {
  print(i)
}
```

    ## [1] 1
    ## [1] 3
    ## [1] 5

Here, we first defined a vector called `sequence`, then **for** every
$i$ in sequence, we print the value of $i$. From the output, you can see
from the output that each element `i` in the sequence was printed in
each iteration.

The same loop can be written in another way:

``` {.r}
sequence <- c(1,3,5)
for (i in 1:length(sequence)) {
  print(sequence[i])
}
```

    ## [1] 1
    ## [1] 3
    ## [1] 5

In the R code above, we use the `length()` function to measure the
length/size of `sequence`, i.e. 3. Then we construct a for loop where
$i$ iterates from 1 to 3, inside the for loop `i` represents the index
of the sequence and putting the index inside the square brackets allows
us to select the $i$th element from `sequence`.

**Write your first loop!**

<codeblock id="02_10_01">

Hint: To extract the i-th element of `nominalGDP_trilion_2017`, you can
use `nominalGDP_trilion_2017[i]`. You can extract the i-th element of
`population_million_2017` using square bracket as well.

</codeblock>

We can do a lot more than when we use for loop together with the control
flow statements (if, else if, else) we learnt before. For example,

``` {.r}
customer_rating <- c(2,3,1,5,5,5)

for (rating in customer_rating) {
  if (rating >= 4) {
  print('Happy Customer!')
  } else if (rating <= 2) {
  print('Angry Customer!')
  } else {
  print('Neutral Customer!')
  }
}
```

    ## [1] "Angry Customer!"
    ## [1] "Neutral Customer!"
    ## [1] "Angry Customer!"
    ## [1] "Happy Customer!"
    ## [1] "Happy Customer!"
    ## [1] "Happy Customer!"

The R code above prints different messages depending on the values in
customer_rating.

**Check your understanding**

Consider the following syntax:

    for (result in student_result) {
      if (result >= 79 & result < 99) {
      print('Superb!')
      } else if (result < 50) {
      print('Try again!')
      } else if (result >= 99) {
      print('Perfect!')
      } else {
      print('Well done!')
      }
    }

Here is the output from the above syntax after we have defined a vector
variable `student_result`.

    [1] "Superb!"
    [1] "Well done!"
    [1] "Try again!"
    [1] "Perfect!"
    [1] "Well done!"
    [1] "Superb!"

Based on the output from the for-loop, which of the following is
`student_result`?

<choice id=0.177286447957158>

<opt text="<code>student_result <- c(99,77,35,97,67,85)</code>" >

Try again! Copy the code and try it with some numbers in R!

</opt>

<opt text="<code>student_result <- c(77,99,35,97,67,85)</code>" >

Try again! Copy the code and try it with some numbers in R!

</opt>

<opt text="<code>student_result <- c(97,77,35,99,67,85)</code>" correct="true">

That's correct!

</opt>

<opt text="<code>student_result <- c(100,77,35,99,67,85)</code>" >

Try again! Copy the code and try it with some numbers in R!

</opt>

</choice>

## While loops

A while loop in R has the following structure:

    while (condition) {
      do_something
    }

In the while loop, R will keep running the code between the brackets
`{ }` repeated until the condition become `FALSE` at some point during
the execution. If the condition is never changed, the while loop will go
on indefinitely.

For example, we create a while loop that will go on subtracting 28.5 (as
weekly_spending) to the variable `bank_balance` until `bank_balance` is
less than `weekly_spending`. If you execute the R code, you will notice
the loop stopped at the 7th iteration.

``` {.r}
bank_balance <- 200
weekly_spending <- 28.5
while (bank_balance >= weekly_spending) {
  bank_balance = bank_balance - weekly_spending
  print(bank_balance)
}
```

    ## [1] 171.5
    ## [1] 143
    ## [1] 114.5
    ## [1] 86
    ## [1] 57.5
    ## [1] 29
    ## [1] 0.5

## Break statement

There are occasions where breaking the loop during execution is a good
idea. The break statement can be used in for loops and while loops.

For example, if we are to set up a early warning system when
`bank_balance` is less than or equal to 4 times `weekly spending`, we
can do the following:

``` {.r}
bank_balance <- 200
weekly_spending <- 28.5
while (bank_balance>= weekly_spending) {
  bank_balance <- bank_balance - weekly_spending
  print(bank_balance)
  if (bank_balance <= 4*weekly_spending){
  print("Find a job and cut weekly spending!")
  break
  }
}
```

    ## [1] 171.5
    ## [1] 143
    ## [1] 114.5
    ## [1] 86
    ## [1] "Find a job and cut weekly spending!"

</exercise>

<exercise id='11' title='Functions'>

Functions are an extremely important concept in almost every programming
language, including R! You can think of functions as a black box: you
give some values as an input, the function processes this input and
generates an output. In R, the function arguments are matched by
position or by name. You can set a default value for some function
arguments, and you can overwrite the default value when you need to.

Here is a simple skeleton of a function in R:

    my_fun_name <- function(arg1, arg2) {
      body
    }

The keyword `function` tells R you are defining a function. The
arguments in the parentheses `( )` are the input of your function, the
inputs can be data and parameters. The operations that you want to
perform (the `body`) should be written inside the curly brackets `{ }`.

Finally, you assign the function defining statement and body to the
variable `my_fun_name`, which is the name of your function. To call
(use) the function, you will need to enter `my_fun_name(arg1, arg2)` in
your code after you defined the function.

**Write your own function**

Create a function `power_three()`: it takes one argument and returns
that number cubed (that number times itself and times itself again).
Call this newly defined function with 12 as input.

<codeblock id="02_11_01">

Hint: Start with the following: `power_three <- function(arg){...}` Fill
in the `...`.

</codeblock>

It is also possible to run a function without an input argument.

In the following example, the function will print the statement "Hello
World!" when the function is called without any inputs.

``` {.r}
hello_world <- function(){
print('Hello World!')
}
```

This can also be useful sometimes when we would like to have random
outcomes from the function. The `sample()` function comes in handy when
we would like to draw a number from a particular range of values.

For example:

``` {.r}
flip_a_coin <- function(){
  outcome <- sample(1:2, size = 1)
  if (outcome == 1) {
    print("Head")} else {
      print("Tail") }
}

#Flip the coin the first time
flip_a_coin()
```

    ## [1] "Head"

``` {.r}
#Flip the coin second time
flip_a_coin()
```

    ## [1] "Head"

``` {.r}
#Flip the coin once again
flip_a_coin()
```

    ## [1] "Tail"

You will get a different outcome ("Head" or "Tail") every time when you
call the function `flip_a_coin`.

**Write your code to roll a die!**

Write a function that takes no input argument and return a random
outcome choosing from 1 to 6, just like rolling a die in R. Name that
function `roll_a_die`.

<codeblock id="02_11_02">

Hint: You can obtain a random integer from 1 to 6 using
`sample(1:6, size = 1)`. Have you try putting that in the function body?

</codeblock>

**Function Scoping**

Note that variables that are defined inside a function are not
accessible outside that function. Variables we use inside a function are
considered as local variables, which are different from variables that
are designed outside of the function (global variables).

**Congratulations! This is the end of R Programming Basics!** Here is a
useful cheat sheet from the Institute for Quantitative Social Science at
Harvard University that summarize introductory R commands nicely:
<https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf>

</exercise>
