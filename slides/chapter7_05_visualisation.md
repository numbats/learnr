---
title: Visualising regression models
type: slides

---
## Plotting models via `geom_smooth()`

-   You can easily plot the fitted model for a bivariate data using
    `geom_smooth()` from `ggplot2`.

``` r
ggplot(cars, aes(dist, speed)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)
```

<img src="chapter7_05_visualisation_files/figure-markdown/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />
