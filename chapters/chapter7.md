---
title: 'Chapter 7: Linear regression with R'
description: |
  This chapter demonstrates how to fit linear models in R using the `lm` function. You'll learn about how to fitting simple linear regression, models with categorical variables and interaction effects, and visualising models with `ggplot2`.
prev: /chapter6
next: /chapter7
type: chapter
id: 7

---
<exercise id="1" title="Simple linear regression" type="slides">

<slides source="chapter7_01_simple-linear-regression">
</slides>

</exercise>

<exercise id="2" title="Practice extracting model estimates">

``` r
library(Ecdat)
str(Cigarette)
```

    ## 'data.frame':    528 obs. of  9 variables:
    ##  $ state : Factor w/ 48 levels "AL","AR","AZ",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ year  : int  1985 1985 1985 1985 1985 1985 1985 1985 1985 1985 ...
    ##  $ cpi   : num  1.08 1.08 1.08 1.08 1.08 ...
    ##  $ pop   : int  3973000 2327000 3184000 26444000 3209000 3201000 618000 11352000 5963000 2830000 ...
    ##  $ packpc: num  116 129 105 100 113 ...
    ##  $ income: int  46014968 26210736 43956936 447102816 49466672 60063368 9927301 166919248 78364336 37902896 ...
    ##  $ tax   : num  32.5 37 31 26 31 ...
    ##  $ avgprs: num  102.2 101.5 108.6 107.8 94.3 ...
    ##  $ taxs  : num  33.3 37 36.2 32.1 31 ...

This data was collected for each state from 1985 to 1995 in USA. The
variables are described further below:

-   `state`: state
-   `year`: year
-   `cpi`: consumer price index
-   `pop`: state population
-   `packpc`: number of cigarette packs per capita
-   `income`: state personal income (total, nominal)
-   `tax`: average state, federal, and average local excise taxes for
    fiscal year
-   `avgprs`: average cigarette price during fiscal year, including
    sales taxes
-   `taxs`: average excise taxes for fiscal year, including sales taxes

A simple linear model for the average cigarette price on average excise
taxes was proposed.

Fit the model using least squares approach and calculate:

(a) residual sum of squares and assign it to `RSS`\
(b) least squares estimate of the intercept to `beta0`\
(c) least squares estimate of the slope to `beta1`

<codeblock id="07_02A">

Hint: What did functions `coef` and `residuals` do?

</codeblock>

</exercise>

<exercise id="3" title="Multiple linear regression" type="slides">

<slides source="chapter7_02_multiple-linear-regression">
</slides>

</exercise>

<exercise id="4" title="Test your knoweldge">

</exercise>

<exercise id="5" title="Regression with categorical variables" type="slides">

<slides source="chapter7_03_regression-with-categorical-var">
</slides>

</exercise>

<exercise id="6" title="Test your knoweldge">

</exercise>

<exercise id="7" title="Regression models with interaction effects" type="slides">
<slides source="chapter7_04_interaction"> </slides>
</exercise>

<exercise id="8" title="Practice">

</exercise>

<exercise id="9" title="Visualising regression models"  type="slides">
<slides source="chapter7_05_visualisation"> </slides>
</exercise>

<exercise id="10" title="Practice">

</exercise>
