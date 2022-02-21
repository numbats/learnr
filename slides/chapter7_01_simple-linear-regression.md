---
title: Simple linear regression
type: slides

---
<style>
.columns {
  display: flex
}
</style>

## Simple linear regression

-   Simple linear regression refers to fitting a straight line
    $y = \beta_0 + \beta_1 x$ to a set of bivariate data.

<div class="columns">

<div class="column" style="width:70%">

``` r
ggplot(cars, aes(speed, dist)) +
  geom_point() + 
  geom_abline(intercept = -17, 
              slope = 4, size = 1.5,
              color = "indianred") + 
  geom_abline(intercept = -5, 
              slope = 3, size = 1.5,
              color = "cadetblue")  + 
  geom_abline(intercept = 80, 
              slope = -3.5, size = 1.5,
              color = "seagreen")
```

</div>

<div class="column" style="width:30%">

<img src="chapter7_01_simple-linear-regression_files/figure-markdown/slr-plot-1.png" style="display: block; margin: auto;" />

</div>

</div>

Notes:

-   Three lines are shown in the plot:
    -   $y = -17 + 4x$
    -   $y = -5 + 3x$
    -   $y = 80 - 3.5x$
-   Which of these three lines do you think explains the relationship
    between $y$ and $x$ the best?

---

## Residuals

-   A strategy to find the best line of fit is generally based on
    residuals.
-   In simple linear regression, the **residuals** are the vertical
    distance of the observations from the fitted line.

<img src="chapter7_01_simple-linear-regression_files/figure-markdown/residuals-1.png" style="display: block; margin: auto;" />

---

## Least squares

$$y = \beta_0 + \beta_1 x$$

-   **Method of least squares** to estimate the parameters, $\beta_0$
    (intercept) and $\beta_1$ (slope).
-   Method of least squares estimate parameters such that it minimizes
    the residual sum of the squares (RSS).
-   **Residuals** = observed $-$ fitted value.
-   **Fitted value** = the predicted response $(y)$ value from the
    fitted model using predictors $(x)$ from the data

Notes:

-   Unless stated otherwise, simple linear regression uses the **method
    of least squares** to estimate the model parameters.
-   Method of least squares estimates the model parameters by finding
    parameters that minimise the sum of the squares of the residual.
-   More formally, residuals are the difference of observed value from
    the fitted value.
-   Fitted values are the predicted response value under the fitted
    model for the predictors in the data.

---

## Sum of the squares of the residuals

<img src="chapter7_01_simple-linear-regression_files/figure-markdown/plot-fits-1.png" style="display: block; margin: auto;" />

Notes:

-   The sum of the red squares are the residual sum of squares (RSS) --
    the actual RSS can be seen on top of the plot
-   It doesn't look like squares because the scale on the x- and y-axis
    differ
-   There is a closed-form solution to finding parameters that minimise
    the residual sum of the squares.
-   You can use calculus to find this or consult any standard first year
    statistics text book.
-   We expect you to know most of these results and focus on fitting
    linear models in R now.

---

## Linear regression in R

-   In R, you can fit a linear regression using the method of least
    squares using the `lm()` function.
-   The input for `lm` is a **two-sided formula** that symbolically
    represents the linear model.
-   For example, `y ~ 1 + x` corresponds to a linear model

$$\color{#006dae}{y_i} = \beta_0 \cdot \color{#006dae}{1} + \beta_1 \cdot \color{#006dae}{x_i} + e_i, \qquad\text{for } i = 1, ..., n, \text{ and assuming }e_i \sim N(0, \sigma^2).$$

Notes:

-   The intercept term `1` is included by default.
-   So `lm(y ~ 1 + x)` is the same as `lm(y ~ x)` .

---

## Fitting the linear regression with R

-   To fit a linear regression, it's best to parse the `data.frame` into
    the `data` argument.
-   The variables in the formula refers to the variables in the input
    data.

``` r
fit <- lm(dist ~  speed, data = cars)
```

-   We'll denote the model like below:

$$\texttt{dist} = \beta_0 + \beta_1 \texttt{speed}.$$

Notes:

$$\texttt{dist} = \beta_0 + \beta_1 \texttt{speed}.$$

-   Above is not a mathematically rigorous representation .
-   If you're representing the model mathematically, you should denote
    the model like below

$$y_i = \beta_0 + \beta_1 x_i + e_i$$ for $i = 1, ..., 50$ where:

-   $y_i$ is the stopping distance of the $i$-th car,
-   $x_i$ is the speed (in miles per gallon) of $i$-th car,
-   $\beta_0$ and $\beta_1$ are the intercept and slope, and
-   we assume the error $e_i \sim NID(0, \sigma^2)$.

---

## Getting the model parameter estimates

-   To get the leqast squares estimates, referred to also as
    **coefficients**, you can use `coef` function:

``` r
coef(fit)
```

    ## (Intercept)       speed 
    ##  -17.579095    3.932409

-   You can get an estimate of $\sigma$ by:

``` r
sigma(fit)
```

    ## [1] 15.37959

---

## Extracting residual

``` r
residuals(fit)
```

    ##          1          2          3          4          5          6          7 
    ##   3.849460  11.849460  -5.947766  12.052234   2.119825  -7.812584  -3.744993 
    ##          8          9         10         11         12         13         14 
    ##   4.255007  12.255007  -8.677401   2.322599 -15.609810  -9.609810  -5.609810 
    ##         15         16         17         18         19         20         21 
    ##  -1.609810  -7.542219   0.457781   0.457781  12.457781 -11.474628  -1.474628 
    ##         22         23         24         25         26         27         28 
    ##  22.525372  42.525372 -21.407036 -15.407036  12.592964 -13.339445  -5.339445 
    ##         29         30         31         32         33         34         35 
    ## -17.271854  -9.271854   0.728146 -11.204263   2.795737  22.795737  30.795737 
    ##         36         37         38         39         40         41         42 
    ## -21.136672 -11.136672  10.863328 -29.069080 -13.069080  -9.069080  -5.069080 
    ##         43         44         45         46         47         48         49 
    ##   2.930920  -2.933898 -18.866307  -6.798715  15.201285  16.201285  43.201285 
    ##         50 
    ##   4.268876

---

## Model summaries

``` r
summary(fit)
```

    ## 
    ## Call:
    ## lm(formula = dist ~ speed, data = cars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -29.069  -9.525  -2.272   9.215  43.201 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -17.5791     6.7584  -2.601   0.0123 *  
    ## speed         3.9324     0.4155   9.464 1.49e-12 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 15.38 on 48 degrees of freedom
    ## Multiple R-squared:  0.6511, Adjusted R-squared:  0.6438 
    ## F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12

---

## Exracting model summary data

-   You can see useful information from `summary(fit)` but it is not
    easy to extract it as a tidy data.

-   The package `broom` has handy functions to get the summary values
    out in a tidy format:

``` r
broom::tidy(fit)
```

    ## # A tibble: 2 × 5
    ##   term        estimate std.error statistic  p.value
    ##   <chr>          <dbl>     <dbl>     <dbl>    <dbl>
    ## 1 (Intercept)   -17.6      6.76      -2.60 1.23e- 2
    ## 2 speed           3.93     0.416      9.46 1.49e-12

``` r
broom::glance(fit)
```

    ## # A tibble: 1 × 12
    ##   r.squared adj.r.squared sigma statistic  p.value    df logLik   AIC   BIC
    ##       <dbl>         <dbl> <dbl>     <dbl>    <dbl> <dbl>  <dbl> <dbl> <dbl>
    ## 1     0.651         0.644  15.4      89.6 1.49e-12     1  -207.  419.  425.
    ## # … with 3 more variables: deviance <dbl>, df.residual <int>, nobs <int>

---

## Augment data with model information

-   You can also easily augment the data with model information,
    e.g. fitted values and residuals.

``` r
broom::augment(fit)
```

    ## # A tibble: 50 × 8
    ##     dist speed .fitted .resid   .hat .sigma  .cooksd .std.resid
    ##    <dbl> <dbl>   <dbl>  <dbl>  <dbl>  <dbl>    <dbl>      <dbl>
    ##  1     2     4   -1.85   3.85 0.115    15.5 0.00459       0.266
    ##  2    10     4   -1.85  11.8  0.115    15.4 0.0435        0.819
    ##  3     4     7    9.95  -5.95 0.0715   15.5 0.00620      -0.401
    ##  4    22     7    9.95  12.1  0.0715   15.4 0.0255        0.813
    ##  5    16     8   13.9    2.12 0.0600   15.5 0.000645      0.142
    ##  6    10     9   17.8   -7.81 0.0499   15.5 0.00713      -0.521
    ##  7    18    10   21.7   -3.74 0.0413   15.5 0.00133      -0.249
    ##  8    26    10   21.7    4.26 0.0413   15.5 0.00172       0.283
    ##  9    34    10   21.7   12.3  0.0413   15.4 0.0143        0.814
    ## 10    17    11   25.7   -8.68 0.0341   15.5 0.00582      -0.574
    ## # … with 40 more rows

---

## Transformations

-   You can apply transformations directly in the model formula:

``` r
fit_transform <- lm(log10(dist) ~  sqrt(speed), data = cars)
```

$$\sqrt{\texttt{dist}} = \beta_0 + \beta_1 \log_{10}(\texttt{speed}).$$

-   Whether this model is sensible is another story.

``` r
coef(fit_transform)
```

    ## (Intercept) sqrt(speed) 
    ## 0.003713579 0.396943075

---

## Predictions from the fitted model

$$\widehat{\texttt{dist}} = -17.58 + 3.93\cdot \texttt{speed}$$

-   The `predict` function can return predicted response values from a
    fitted model:

``` r
predict(fit, data.frame(speed = c(5, 10)))
```

    ##         1         2 
    ##  2.082949 21.744993

Notes:

<img src="chapter7_01_simple-linear-regression_files/figure-markdown/predict-plot-1.png" style="display: block; margin: auto;" />

---

## Predictions from the model with transformations

$$\log_{10}(\widehat{\texttt{dist}}) = -4.42 + 9.23\cdot \sqrt{\texttt{speed}}$$

-   No need to transform the covariates with `predict`:

``` r
predict(fit_transform, data.frame(speed = c(5, 10)))
```

    ##         1         2 
    ## 0.8913053 1.2589578

-   But the prediction is the response
    $\log_{10}({\widehat{\texttt{dist}}})$, so you need to apply the
    inverse transformation to get the value of
    $\widehat{\texttt{dist}}$.

Notes:

-   Prediction of $\texttt{dist}$:

``` r
10^predict(fit_transform, data.frame(speed = c(5, 10)))
```

    ##         1         2 
    ##  7.785836 18.153392

<img src="chapter7_01_simple-linear-regression_files/figure-markdown/predict-plot-transform-1.png" style="display: block; margin: auto;" />

---

## Summary

-   You've seen how the `lm` function is used to fit linear models.
-   You can use functions like `summary`, `coef`, `sigma`,
    `broom::tidy`, `broom::glance`, and `broom::augment` to get
    information about the fitted model.
-   Transformations can be applied directly in model formula.
-   The `predict` function is useful get the prediction of the response
    for a new set of data.
