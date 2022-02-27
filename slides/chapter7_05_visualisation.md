---
title: Visualising regression models
type: slides

---
## Plotting models via `geom_smooth()`

-   You can easily plot the fitted model for a bivariate data using
    `geom_smooth()` from `ggplot2`.

``` {.r}
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)
```

<img src="chapter7_05_visualisation_files/figure-markdown/geom-smooth-1.png" style="display: block; margin: auto;" />

Notes:

-   The `library(tidyverse)` is already loaded here!

---

## Modifying formula in `geom_smooth()`

-   You can modify formula on the left hand side based on `x`

``` {.r}
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = y ~ poly(x, 3))
```

<img src="chapter7_05_visualisation_files/figure-markdown/smooth-lm-1.png" style="display: block; margin: auto;" />

---

## Caution with `geom_smooth()`

-   But it's not the same for the right hand side!

``` {.r}
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = log10(y) ~ poly(x, 3))
```

<img src="chapter7_05_visualisation_files/figure-markdown/smooth-lm2-1.png" style="display: block; margin: auto;" />

Notes:

-   This is because `ggplot2` relies on `predict()` for the response
    (`log(y)`) but doesn't know what the inverse function to recover `y`
    is.

---

## Combining scales with `geom_smooth()`

-   Below is actually showing `lm(log10(speed) ~ dist, data = cars)`:

``` {.r}
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = y ~ x) +
  scale_y_log10()
```

<img src="chapter7_05_visualisation_files/figure-markdown/smooth-lm3-1.png" style="display: block; margin: auto;" />

---

## Back-transforming with `geom_smooth()`

-   We add the inverse transformation for `y` below to get back the
    original scale before the `log10` transformation:

``` {.r}
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = y ~ x) +
  scale_y_log10(breaks = seq(5, 35, 5)) +
  coord_trans(y = scales::exp_trans(10))
```

Notes:

<img src="chapter7_05_visualisation_files/figure-markdown/smooth-lm4-1.png" style="display: block; margin: auto;" />

---

## Summary

-   You can easily visualise regression models using `geom_smooth` for
    bivariate data.
-   If the scale for `x` and/or `y` have been transformed, be aware that
    the fitted model is not the same as the `formula` in `geom_smooth`.
