---
title: Vectors
type: slides

---
## Vectors

Vectors (and matrices) are used a lot in equations, models, mathematical
optimization problems. Learning how to read and use them allows you to
(i) understand complex operations and (ii) express operations that you
want to perform in a compact and elegant way.

A **vector** is an ordered finite list of numbers. You may have seen
them before, for example, a (column) vector x can be written as follow:

$$ x = (4,7,6,3,2) = \\begin{bmatrix}4\\\\7\\\\6\\\\3\\\\2 \\end{bmatrix} $$

Note that a row vector (say, `y`) can be written as *y* = (3 4 7 4 2) or
$y = \\begin{bmatrix} 3&4&7&4&2\\end{bmatrix}$.

In R, vectors are one-dimension arrays that can hold numeric data,
character data or logical data. You can create a vector in R with the
combine function `c()`, where each element in the vector is separated by
a comma `,`. You can express the vector `x` above with the following R
code:

    x <- c(4,7,6,3,2)

---

## Vector Operations

**Vector addition and subtraction**

If `a` and `b` are vectors of the same size, `a+b` and `a-b` give their
sum and difference, respectively.

    a <- c(1,2,3)
    b <- c(100,200,300)
    a+b

    ## [1] 101 202 303

    a-b

    ## [1]  -99 -198 -297

---

**Scalar-vector multiplication and division**

If `c` is a number and `a` is a vector (from above), you can express the
scalar-vector product either as `c*a` or `a*c`. For example, if you do
`3*a` and `a*3`:

    3*a

    ## [1] 3 6 9

    a*3

    ## [1] 3 6 9

**Scalar-vector addition**

In R, you can add a scalar `c` and a vector `a` using c+a. This means
that the scalar is added to each element of the vector. For example, if
you do `3+a`:

    3+a

    ## [1] 4 5 6

This is, however, **NOT** a standard mathematical notation. (In
mathematical notations, we should use this as, e.g. *a* + *c***1**,
where *a* is a vector and *c* is a scalar.)

---

## Indexing and Slicing

**Indexing**

To select elements of a vector (and later matrices, data frames, …), you
can use square brackets `[ ]`. Between the square brackets, you indicate
what elements to select. For example, consider a vector *x*, a specific
element *x*<sub>*i*</sub> is selected with the expression `x[i]` where
`i` is the index (which runs from 1 to *n*, for a vector with *n*
elements). Say, we would like to obtain the 5th entry from the following
vector *x*:

    x = c(5,6,3,4,5,8,23,4,6,4,3,23,7,5,4,23,7,90)
    x[5]

    ## [1] 5

**Slicing**

Sometimes it is of interest to extract a slice of a vector (a
sub-vector) using an index range as the argument.
*x*<sub>*r* : *s*</sub> denotes the slice of the vector from index *r*
to *s*. In the code below, `x[1:4]` selects the element from index 1 to
4.

    x[1:4]

    ## [1] 5 6 3 4