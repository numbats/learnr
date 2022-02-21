---
title: Multiple linear regression
type: slides

---
## Assumptions for linear models

For $i = 1, ..., n$,

$$y_i = \beta_0 + \beta_1 x_{i1} + ... +  \beta_kx_{ik} + e_i$$ where we
assume $\color{red}{e_i \sim NID(0, \sigma^2)}$ i.e. independent and
(identically) normally distributed with mean 0 and variance $\sigma^2$.

---

## Illustrative data: marketing

``` r
data(marketing, package = "datarium")
str(marketing)
```

    ## 'data.frame':    200 obs. of  4 variables:
    ##  $ youtube  : num  276.1 53.4 20.6 181.8 217 ...
    ##  $ facebook : num  45.4 47.2 55.1 49.6 13 ...
    ##  $ newspaper: num  83 54.1 83.2 70.2 70.1 ...
    ##  $ sales    : num  26.5 12.5 11.2 22.2 15.5 ...

???

Notes:

-   The data contains the impact of three advertising medias on sales.
-   The variables in the data are:
    -   `youtube`: the amount of advertising budget spent on youtube
        advertising (in \$1000),
    -   `facebook`: the amount of advertising budget spent on facebook
        advertising (in \$1000),
    -   `newspaper`: the amount of advertising budget spent on newspaper
        advertising (in \$1000), and
    -   `sales`: the amount of sales in (\$1000).
-   Each observation corresponds to one particular trial period.
-   There are 200 trial periods in total.
