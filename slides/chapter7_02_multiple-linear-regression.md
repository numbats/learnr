---
title: Multiple linear regression
type: slides

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

---

## Pair plots

``` r
GGally::ggpairs(marketing)
```

<img src="chapter7_02_multiple-linear-regression_files/figure-markdown/ggpairs-1.png" style="display: block; margin: auto;" />

---

## Plot of correlation matrix

``` r
GGally::ggcorr(marketing)
```

<img src="chapter7_02_multiple-linear-regression_files/figure-markdown/ggcorr-1.png" style="display: block; margin: auto;" />

Notes:

``` r
cor(marketing)
```

    ##              youtube   facebook  newspaper     sales
    ## youtube   1.00000000 0.05480866 0.05664787 0.7822244
    ## facebook  0.05480866 1.00000000 0.35410375 0.5762226
    ## newspaper 0.05664787 0.35410375 1.00000000 0.2282990
    ## sales     0.78222442 0.57622257 0.22829903 1.0000000

---

## Multiple linear regression

A natural extension of simple linear regression is to consider models
with more than one predictor:

$$y_i = \beta_0 + \beta_1 x_{i1} + ... +  \beta_kx_{ik} + e_i$$ for
$i = 1, ..., n$, where we assume <span style="color:red">$e_i$ are
i.i.d. $NID(0, \sigma^2)$</span>.

Notes:

-   i.i.d. = independent and identically distributed

---

## Multiple linear regression with R

To fit

$$\texttt{sales}_i = \beta_0 + \beta_1 \texttt{youtube}_i + \beta_2 \texttt{facebook}_i + \beta_3 \texttt{newspaper}_i + e_i$$

``` r
fit <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
coef(fit)
```

    ##  (Intercept)      youtube     facebook    newspaper 
    ##  3.526667243  0.045764645  0.188530017 -0.001037493

<aside class="notes">

-   So the fitted model is approximately,

$$\widehat{\texttt{sales}} = 3.53 + 0.0458 \times \texttt{youtube} + 0.189 \times \texttt{facebook} - 0.001 \times \texttt{newspaper}.$$

</aside>

---

## Residual plot

<img src="chapter7_02_multiple-linear-regression_files/figure-markdown/res-plot-1.png" style="display: block; margin: auto;" />

Notes:

-   The code to produce these plots is:

``` r
library(tidyverse)
library(patchwork)

g1 <- marketing %>% 
  mutate(.resid = residuals(fit),
         .fitted = fitted(fit)) %>% 
  ggplot(aes(youtube, .resid)) + 
  geom_point() +
  geom_hline(yintercept = 0)
g2 <- g1 + aes(x = facebook)
g3 <- g1 + aes(x = newspaper)
g4 <- g1 + aes(x = .fitted)

(g1 + g2) / (g3 + g4) + plot_annotation(tag_levels = "A")
```

-   A residual plot usually refers to the scatterplot of residuals
    against an independent variable.
-   A residual plot may sometimes refer to the scatterplot of residuals
    against the fitted values.
-   The residual may be substituted with standardised or studentized
    residuals.
-   Recall you assume that $e_i$ is i.i.d. $N(0, \sigma^2)$ -- under
    this assumption, **there should be no visible pattern in the
    residual plot**.
-   If there are visible trends in the residual plot, this suggests that
    there are some other variable not accounted for in modelling the
    response.
-   Here, we see a "ribbon" shape for plots A and B -- this suggests
    that any inferences drawn from the fitted model may not be
    appropriate.

---

## Summary

-   You can extend a simple linear regression by adding more covariates
    in the model in the symbolic formula of `lm`.
-   Remember to do some model diagnostics, e.g. using the residual
    plots.
-   A pattern in the residual suggests that the model may be
    inappropriate to use for inferences.
