---
title: Multiple layers in `ggplot2`
type: slides

---
## Facets

-   Faceting in `ggplot2` refers to partitioning of the plot region to
    multiple panels each showing a different subset of the data.

-   There are three types of faceting:

    -   `facet_null()` (the default),
    -   `facet_wrap()`, and
    -   `facet_grid()`.

Notes:

-   We don't really use `facet_null()` much.

---

## Illustrative data 🌱 growth of soybean

``` {.r}
data(davidian.soybean, package = "agridat")
str(davidian.soybean)
```

    ## 'data.frame':    412 obs. of  5 variables:
    ##  $ plot   : Factor w/ 48 levels "1988F1","1988F2",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ variety: Factor w/ 2 levels "F","P": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ year   : int  1988 1988 1988 1988 1988 1988 1988 1988 1988 1988 ...
    ##  $ day    : int  14 21 28 35 42 49 56 63 70 77 ...
    ##  $ weight : num  0.106 0.261 0.666 2.11 3.56 ...

Notes:

-   The data contains:
    -   `plot`: the plot code
    -   `variety`: the code (`F` = commercial and `P` = experimental)
        for which soybean variety
    -   `year`: the year it was grown (1988-1990)
    -   `day` days after planting
    -   `weight` weight of soybean leaves

---

## `facet_wrap()`

-   `facet_wrap()` divides the data into mutually exclusive subset based
    on the input variable and create subplots based on the data in the
    corresponding panel.

``` {.r}
library(ggplot2)
```

    ## Warning in register(): Can't find generic `scale_type` in package ggplot2 to
    ## register S3 method.

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_wrap(~year)
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-wrap-demo-1.png" style="display: block; margin: auto;" />

---

## Wrapping many panels

-   `facet_wrap` "wraps" the panels into 2d if you have many panels

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_wrap(~plot)
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-wrap-demo-wrap-1.png" style="display: block; margin: auto;" />

---

## Wrapping by a continuous variable

-   Discretize continuous variable using `cut()`, `cut_width()`,
    `cut_interval()` or `cut_number()`.

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_wrap(~cut_number(day, 4))
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-wrap-demo-cont-1.png" style="display: block; margin: auto;" />

Notes:

-   The cut functions categorize the continuous variable into discrete
    levels.

---

## Changing the scales for each panel

-   By default the scales are shared across the panels but you can
    choose to have scales built independently for each panel:

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_wrap(~cut_number(day, 4), scales = "free")
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-wrap-demo-cont-scales-1.png" style="display: block; margin: auto;" />

Note:

-   If you want the scale to be independent only in one dimension then
    you can use `scales = "free_x"` and `scales = "free_y"`.

---

## Wrapping with more than one variables

-   If you want to wrap the facet by more than one variable, you can
    combine the variables by using `+`:

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_wrap(~ year + variety)
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-wrap-demo-interaction-1.png" style="display: block; margin: auto;" />

Notes:

-   Alternatively, you can use `vars()` instead of `+`.

---

## `facet_grid()`

-   Alternatively, you can use `facet_grid()` to lay out the panels in a
    2d grid:

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point() +
  facet_grid(variety ~ year)
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-grid-demo-1.png" style="display: block; margin: auto;" />

---

## Missing facet variables

-   If a layer data is missing the faceting variable(s), then the layer
    will be shown across all panels based on all of the layer data

``` {.r}
ggplot(davidian.soybean, aes(day, weight)) + 
  geom_point(data = dplyr::select(davidian.soybean, -c(variety, year)),
             color = "grey70") +
  geom_point() +
  facet_grid(variety ~ year)
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/facet-all-1.png" style="display: block; margin: auto;" />

Notes:

-   This is a nice way to creating a "shadow" across all panels.

---

## Combining plots with `patchwork`

-   We use the `patchwork` package for combining plots.

``` {.r}
library(patchwork)
```

-   Combining multiple `ggplot` objects is then just a matter of using
    `+` (side-by-side) or `/` (top-to-bottom).

---

## Demo with `patchwork`

``` {.r}
g1 <- ggplot(davidian.soybean, aes(day, weight)) +
  geom_point(aes(color = as.factor(year))) 
g2 <- ggplot(davidian.soybean, aes(as.factor(year), weight)) +
  geom_jitter(aes(color = as.factor(year))) 
g1 + g2
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/patchwork-demo-1.png" style="display: block; margin: auto;" />

---

### Combining plot layouts

-   `patchwork` can collect the same guides across the plots as well as
    automatically add tag labels

``` {.r}
g1 + g2 + 
  plot_layout(guides = "collect") + 
  plot_annotation(tag_levels = "A")
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/patchwork-layouts-1.png" style="display: block; margin: auto;" />

---

### Plot layout

-   You can combine the use of `+` and `/` to layout plots horizontally
    or vertically using `(` to group rows or columns

``` {.r}
(g1 + g2) / (g2 + g1) + 
  plot_layout(guides = "collect")
```

<img src="chapter6_06_ggplot2facet_files/figure-markdown/patchwork-layout-1.png" style="display: block; margin: auto;" />

---

## Flexible plot layout

-   If you want even more control over the plot layout, then you can
    specify a string with the structure you want like below:

``` {.r}
design <- "
 11###
 11###
 #2222"

g1 + g2 + 
  plot_layout(guides = "collect",
              design = design)
```

Notes:

-   Notice the empty spots in this plot output.
-   How does it align the the `design`?

<img src="chapter6_06_ggplot2facet_files/figure-markdown/patchwork-design-1.png" style="display: block; margin: auto;" />

---

## Summary

-   You can view multiple subplots for different partitions of the data
    using `facet_wrap()` or `facet_grid()`.
-   You can combine plots using `patchwork` package.
