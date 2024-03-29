---
title: 'Chapter 7: Linear regression with R'
description: |
  This chapter demonstrates how to fit linear models in R. You'll learn about how to fitting simple linear regression, models with categorical variables and interaction effects, and visualising models with ggplot2.
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

Hint: What did functions `coef()` and `residuals()` do?

</codeblock>

</exercise>

<exercise id="3" title="Multiple linear regression" type="slides">

<slides source="chapter7_02_multiple-linear-regression">
</slides>

</exercise>

<exercise id="4" title="Test your knowledge">

We extend the previous model for the average cigarette price by
regressing it on the covariates:

-   average excise taxes for fiscal year and
-   consumer price index.

``` r
library(tidyverse)
library(broom)
data(Cigarette, package = "Ecdat")

fit <- lm(avgprs ~ taxs + cpi, data = Cigarette)
ggplot(augment(fit), aes(.fitted, .resid)) +
  geom_hline(yintercept = 0) +
  geom_point() 
```

<img src="ch7/unnamed-chunk-2-1.png" width="432" style="display: block; margin: auto;" />

Based on the above plot, do you think the fitted model is reasonable?

<choice id=0.677027905359864>

<opt text="Yes" >

Nope. Try again.

</opt>

<opt text="No" correct="true">

That's right! There's a clear curve in the residual vs fitted plot.

</opt>

</choice>

</exercise>

<exercise id="5" title="Regression with categorical variables" type="slides">

<slides source="chapter7_03_regression-with-categorical-var">
</slides>

</exercise>

<exercise id="6" title="Practice modelling with categorical variables">

Below we calculate the mean of the average cigarette prices across the
years by state.

``` r
Cigarette %>% 
  group_by(state) %>% 
  summarise(avg = mean(avgprs)) %>% 
  deframe()
```

    ##       AL       AR       AZ       CA       CO       CT       DE       FL 
    ## 139.7866 148.9497 150.2908 169.2056 138.4311 176.9969 141.2955 162.9414 
    ##       GA       IA       ID       IL       IN       KS       KY       LA 
    ## 134.1717 156.8082 146.3151 158.2791 134.7945 149.1001 122.1246 148.8910 
    ##       MA       MD       ME       MI       MN       MO       MS       MT 
    ## 164.5658 142.2264 163.6511 153.6489 176.6886 132.2249 148.1670 137.1841 
    ##       NC       ND       NE       NH       NJ       NM       NV       NY 
    ## 123.6782 155.1322 151.7466 139.1136 163.4517 145.4603 171.6562 169.5765 
    ##       OH       OK       OR       PA       RI       SC       SD       TN 
    ## 139.4949 149.3375 153.6705 148.2836 159.7435 130.4506 145.7649 144.4112 
    ##       TX       UT       VA       VT       WA       WI       WV       WY 
    ## 162.7255 153.6170 135.9938 148.2788 185.1092 161.5576 146.3152 130.8280

Model the average cigarette price on the categorical variable `state`
with the intercept removed from the model. Assign the coefficients from
your model to `betas`. Do you notice anything about the values printed?

<codeblock id="07_06A">

Hint: Add `-1` or `0` to the right hand side of the model formula to
remove the intercept.

</codeblock>

</exercise>

<exercise id="7" title="Regression models with interaction effects" type="slides">
<slides source="chapter7_04_interaction"> </slides>
</exercise>

<exercise id="8" title="Visualising regression models"  type="slides">
<slides source="chapter7_05_visualisation"> </slides>
</exercise>
