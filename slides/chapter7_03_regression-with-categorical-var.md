---
title: Regression with categorical variables
type: slides

---
## Tooth growth data

-   We'll now use the `ToothGrowth` data to illustrate a model with a
    categorical variable:

``` r
str(ToothGrowth)
```

    ## 'data.frame':    60 obs. of  3 variables:
    ##  $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
    ##  $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...

Notes:

-   `ToothGrowth` contains observations on 60 guinea pigs with
    variables:
    -   `len`: the tooth length
    -   `supp`: supplement type (VC = vitamin C, OJ = orange juice)
    -   `dose`: dose of supplement in milligrams/days

<img src="chapter7_03_regression-with-categorical-var_files/figure-markdown/toothgrowth-plot-1.png" style="display: block; margin: auto;" />

---

## Categorical variable in `lm`: illustration

-   `supp` is a factor with two levels: "VC" and "OJ"
-   What model are we fitting below?

``` r
fit1s <- lm(len ~ 1 + as.numeric(supp=="VC"), 
            data = ToothGrowth)
```

$$\color{#006dae}{y_{ijk}} = \beta_0\cdot \color{#006dae}{1} + \beta_1 \color{#006dae}{x_{i}}+ e_{ijk},$$
$$\text{for }i = 1, 2, j = 1, 2, 3, k = 1, ..., 10.$$ Notes:

where

-   $i$ corresponds to the level of the supplementary variable,
-   $j$ corresponds to the dose level,
-   $k$ corresponds to the replicate number,
-   $x_i = 0$ if $i = 1$ (OJ) and $x_i = 1$ if $i = 2$ (VC),
-   $y_{ijk}$ is the tooth length, and
-   we assume $e_{ijk} \sim N(0, \sigma^2)$.

---

## Categorical variable in `lm`: actual

-   Alternatively, we fit the categorical variable directly:

``` r
fit2s <- lm(len ~ supp, data = ToothGrowth)
```

-   Above model is the equivalent as `fit1s`:

``` r
coef(fit1s)
```

    ##              (Intercept) as.numeric(supp == "VC") 
    ##                 20.66333                 -3.70000

``` r
coef(fit2s)
```

    ## (Intercept)      suppVC 
    ##    20.66333    -3.70000

Notes:

-   Instead of creating dummy variables, like $x_{1i}$, for a
    categorical variable, it is more convenient to use the categorical
    variable directly in the symbolic model formula.
-   By default `lm` uses the treatment constraint (`?contr.treatment`),
    i.e. first level of the categorical variable is omitted (which is
    the same as constraining the corresponding coefficient to zero).

---

## Predicted values

$$\widehat{\texttt{len}} = 20.66 - 3.7 \cdot \texttt{supp}_{\texttt{VC}}$$

-   There are only two possible response values from this model:

``` r
predict(fit2s, data.frame(supp = c("OJ", "VC")))
```

    ##        1        2 
    ## 20.66333 16.96333

-   Under this model, the average tooth length of a guinea pig with
    orange juice supplement is 20.66 units and with vitamin C is 16.96
    units.

Notes:

<img src="chapter7_03_regression-with-categorical-var_files/figure-markdown/toothgrowth-plot2-1.png" style="display: block; margin: auto;" />

-   Is this a reasonable model though?

---

## Numerical categorical variable

-   Recall that `dose` is coded as a *numerical* variable with three
    possible values: 0.5, 1, and 2.

-   Different encoding results in different fitted models:

``` r
fit1 <- lm(len ~ dose, data = ToothGrowth)
coef(fit1)
```

    ## (Intercept)        dose 
    ##    7.422500    9.763571

``` r
fit2 <- lm(len ~ dose, data = mutate(ToothGrowth, dose = factor(dose)))
coef(fit2)
```

    ## (Intercept)       dose1       dose2 
    ##      10.605       9.130      15.495

Notes:

-   It's the user's responsibility to be aware of what model is fitted
    and being able to interpret the models appropriately.
-   Please consult standard first year statistics text books for
    interpreting models -- we only teach you how to fit models in R but
    statistical theory is beyond the scope of these materials.

---

## Summary

-   You can add categorical variables in the symbolic model formulae
    instead of creating a set of dummy variables.
-   The fitted model changes based on whether the variable is encoded as
    numerical or factor/character -- as a user, you need to make sure
    you understand/check what model you are fitting.
