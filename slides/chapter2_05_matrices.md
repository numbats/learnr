---
title: Matrices
type: slides

---
## Matrices

A **matrix** is a rectangular array of numbers written between
rectangular brackets (or large parentheses).

For example, matrix `A` is defined as follow:

$$ A = \begin{bmatrix}4&3&2\\7&4&2\\6&3&4\\3&0&0\\2&-2&-3 \end{bmatrix} $$
Note:

Matrix `A` here is a $5 \times 3$ matrix (pronounced as `5 by 3`,
indicating there are 5 rows and 3 columns in the matrix).

---

You can construct a matrix in R using the `matrix()` function.

You can express the matrix `A` on the previous slide with the following
R code:

    A <- matrix(c(4,3,2,7,4,2,6,3,4,3,0,0,2,-2,-3), byrow=TRUE, nrow=5)

Note:

In R, a matrix is a collection of elements of the same data type
(numeric, character, or logical) arranged into a fixed number of rows
and columns.

In the R code shown on the slides:

-   Here the first argument is the collection of elements that R will
    arrange into the rows and columns of the matrix.

-   The second argument `byrow` indicates the arrangement of elements is
    done by filling the matrix by the rows. If you would like to fill
    the matrix by columns, you can use `byrow=FALSE`.

-   The third argument `nrow` indicates that the number of rows in the
    matrix.

---

### Matrix Operations

Consider the following operation:

``` r
A <- matrix(c(4,3,2,7,4,2,6,3,4,3,0,0,2,-2,-3), byrow=TRUE, nrow=5)
2*A
```

    ##      [,1] [,2] [,3]
    ## [1,]    8    6    4
    ## [2,]   14    8    4
    ## [3,]   12    6    8
    ## [4,]    6    0    0
    ## [5,]    4   -4   -6

`2 * A` multiplies each element of `A` by two.

Notes:

Similar to what you have learned with vectors, the standard operators
like `+`, `-`, `/`, `*`, etc. work in an element-wise way on matrices in
R.

For example, `2 * A` multiplies each element of `A` by two.

---

Consider another matrix `B` defined as

    B <- matrix(c(1,1,1,2,2,2,0,0,0,-1,-1,-1,0,0,0), byrow=TRUE, nrow=5)

`A*B` creates a matrix where each element is the product of the
corresponding elements in matrix `A` and matrix `B`.

``` r
B <- matrix(c(1,1,1,2,2,2,0,0,0,-1,-1,-1,0,0,0), byrow=TRUE, nrow=5)
A*B
```

    ##      [,1] [,2] [,3]
    ## [1,]    4    3    2
    ## [2,]   14    8    4
    ## [3,]    0    0    0
    ## [4,]   -3    0    0
    ## [5,]    0    0    0

Note:

Those who are familiar with matrices should note that `A*B` creates a
matrix where each element is the product of the corresponding elements
in matrix `A` and matrix `B`. It is **not** the standard matrix
multiplication for which you should use `%*%` in R.

---

### Add rows or columns to a matrix

Sometimes we may want to add new data or information to a matrix with
more rows or more columns.

You can use the `cbind()` function.

``` r
A <- matrix(c(4,3,2,7,4,2,6,3,4,3,0,0,2,-2,-3), byrow=TRUE, nrow=5)
B <- matrix(c(1,1,1,2,2,2,0,0,0,-1,-1,-1,0,0,0), byrow=TRUE, nrow=5)
big_matrix <- cbind(A, B)
big_matrix
```

    ##      [,1] [,2] [,3] [,4] [,5] [,6]
    ## [1,]    4    3    2    1    1    1
    ## [2,]    7    4    2    2    2    2
    ## [3,]    6    3    4    0    0    0
    ## [4,]    3    0    0   -1   -1   -1
    ## [5,]    2   -2   -3    0    0    0

Note:

You can add a column or multiple columns to a matrix with the `cbind()`
function, which merges matrices and/or vectors together by column. For
example, `cbind(A,B)` yields a bigger matrix by merging matrix A and B.
The resulting matrix has 5 rows and 6 columns.

---

Similarly, you can add a row or multiple rows to a matrix with the
`rbind()` function.

``` r
big_matrix2 <- rbind(A,B)
big_matrix2
```

    ##       [,1] [,2] [,3]
    ##  [1,]    4    3    2
    ##  [2,]    7    4    2
    ##  [3,]    6    3    4
    ##  [4,]    3    0    0
    ##  [5,]    2   -2   -3
    ##  [6,]    1    1    1
    ##  [7,]    2    2    2
    ##  [8,]    0    0    0
    ##  [9,]   -1   -1   -1
    ## [10,]    0    0    0

Note:

For example, `big_matrix2 <- rbind(A,B)` returns a bigger matrix by
putting matrix A on top of matrix B. The resulting matrix has 10 rows
and 3 columns.

---

### Indexing

You can use the square brackets (`[ ]`) and comma (`,`) to select one or
multiple elements from a matrix.

For example, `A[1:4,3:5]` returns a matrix with the data on the rows 1,
2, 3, 4 and columns 3, 4, 5.

If you want to select all elements of a row or a column, you can do the
following:

-   `A[,1]` selects all elements of the first column of matrix A.
-   `A[1,]` selects all elements of the first row of matrix A.

Notes:

Similar to vectors, you can use the square brackets `[ ]` to select one
or multiple elements from a matrix. Whereas vectors have one dimension,
matrices have two dimensions. You should therefore use a comma to
separate the rows you want to select from the columns.
