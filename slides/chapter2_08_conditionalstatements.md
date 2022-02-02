---
title: Conditional Statements
type: slides

---
## Relational operators

Relational operators, or comparators, are operators which help us see
how one R object relates to another. The relational operators in R are:

-   `<` for less than
-   `>` for greater than
-   `<=` for less than or equal to
-   `>=` for greater than or equal to
-   `==` for equal to each other
-   `!=` not equal to each other

You can use these command on scalar. For example, `8 > 1` return `TRUE`
since 8 is larger than 1. `8 == 1` return ‘FALSE’ since 8 is not equal
to 1. This command also extends to vectors. It tests for every element
of the vector if the condition stated by the comparison operator is TRUE
or FALSE. For example,

    c(0,5,100) == 5

    ## [1] FALSE  TRUE FALSE

You can see that both the first and the last entry evaluates to `FALSE`
and only the second entry returns `TRUE` since the second entry is equal
to 5.

---

Now if instead we do

    c(0,5,100) >= 5

    ## [1] FALSE  TRUE  TRUE

You can see the output changed since 100 is also greater than or equal
to 5.

If we change our code into

    c(0,5,100) < 5

    ## [1]  TRUE FALSE FALSE

You can see the output changed where the second entry is also `FALSE`
since 5 is not strictly less than 5.

Note that R also support element-wise comparison if we put a relational
operator between two vectors:

    c(2,4,6) < c(3,5,7)

    ## [1] TRUE TRUE TRUE

---

## Logical opeators

You know how to use relational operators in R. Next, what if you want to
change or combine the results of these comparisons? In R, you can do
this using the AND (`&`), the OR (`|`), and the NOT (`!`) operator.

**the AND (`&`) operator**

The AND operator typically takes two logical values and returns TRUE
only if both the logical values are TRUE themselves. For example, if we
check the entries of the following vector x is greater than 2 AND less
than 6, we expect `TRUE` for the three entries in the middle.

    x = c(1,2,3,4,5,6,7)
    (x>2)&(x<6)

    ## [1] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE

**the OR (`|`) operator**

The OR operator (|) works similarly, but the difference is that only at
least one of the logical values it uses should be equal to TRUE for the
entire OR operation to evaluate to TRUE. For example,

    x = c(1,2,3,4,5,6,7)
    (x>4)|(x<2)

    ## [1]  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE

---

**the NOT (`!`) operator**

The NOT operator negates the logical value it’s used on. For example,
the built-in R function, is `is.numeric()` checks if an R object is a
numeric.

Say we want to check if an object `a` is a numeric, where `a` is
actually a string `rain`, we expect the output to be `FALSE`. Consider
also object `b` is a number, then the expected output is `TRUE`.

    a <- "rain"
    is.numeric(a)

    ## [1] FALSE

    is.numeric(100)

    ## [1] TRUE

If we, instead, use `!is.numeric(a)` to check if `a` is, the output is
now `TRUE`.

    !is.numeric(a)

    ## [1] TRUE

And when we run `!is.numeric(100)` in R, the output would be `FALSE`.

---

## Conditional statements

Now we are ready to learn about conditional statements: if, else, else
if. These conditional statements are very useful in data analysis since
often we want to treat the data differently depending on certain
conditions.

**if statement**

The syntax of an if statement looks like this:

    if (condition) {
      do_this
    }

So if the `condition` is evaluated to be `TRUE`, the code included in
the curly bracket (`do_this`) will be executed.

For example, `customer_rating` contains a rating (out of 5) from a
customer dined in a restaurant. We consider a customer to be happy if
the rating is greater than or equal to 4.

    customer_rating = 4
    if (customer_rating >= 4){
      print("Customer is happy!")
    }

    ## [1] "Customer is happy!"

---

**else statement**

You can only use an else statement together with an if statement. The
else statement does not require a condition. The code that comes under
the else statement is executed if all of the if statements evaluated to
be `FALSE`.

    if (condition) {
      do_this
    } else {
      do_this_instead
    }

So if the `condition` is evaluated to be `TRUE`, the code included in
the first curly bracket (`do_this`) will be executed. Otherwise, the
code included in the second curly bracket (`do_this_instead`) will be
executed.

It’s important that the syntax `else` is on the **same line** as the
closing bracket of the if part!

For example, we would like to be alerted if a customer is not happy.

    customer_rating = 2
    if (customer_rating >= 4){
      print("Customer is happy!")
    } else { 
      print("Attention - unhappy customer!")
    }

    ## [1] "Attention - unhappy customer!"

---

**else if statement**

The else if statement allows you to further customize your control
structure. You can add as many else if statements as you like such that
you can customize the action of your code depending on the conditions.

    if (condition1) {
      action1
    } else if (condition2) {
      action2
    } else if (condition3) {
      action3
    } else {
      action4
    }

For example, we would like to distinguish between happy customer (with
rating 4 or above), neutral customer (rating to be less than 4 but
higher than 2) and unhappy customer (rating not more than 2). Then we
can do:

    customer_rating = 3
    if (customer_rating >= 4){
      print("Customer is happy!")
    } else if (customer_rating <= 2){ 
      print("Attention - unhappy customer!")
    } else {
      print("Neutral customer.")
    }

    ## [1] "Neutral customer."
