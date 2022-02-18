---
title: Multiple layers in `ggplot2`
type: slides

---
## Scales

-   Scales control the mapping from **data** to aesthetics
-   They usually come in the format like below:

<center>
<img src="images/ggplot-scale.png">
</center>

-   E.g. `scale_x_continuous()`, `scale_fill_discrete()`,
    `scale_y_log10()` and so on.

Notes:

For example:

``` r
ggplot(diamonds, aes(carat, price)) +
  geom_point() + 
  scale_y_log10()
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/scale-demo-1.png" style="display: block; margin: auto;" />

---

## Guide

-   The scale creates a **guide**: an **axis** or **legend**

<center>
<img src="images/guides-dissection.png">
</center>

Notes:

-   To modify these you generally use `scale_*` or other handy functions
    (e.g. `guides`, `labs`, `xlab`, `ylab`, and so on).

---

## Let's use this plot for modifying scales

``` r
g <- ggplot(diamonds, aes(carat, price)) + geom_hex()
g
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/example-1.png" style="display: block; margin: auto;" />

---

## Modifying axis

``` r
g + 
  scale_y_continuous(name = "Price", 
                     breaks = c(0, 10000),
                     labels = c("0", "More\n than\n 10K")) + 
  geom_hline(yintercept = 10000, color = "red", size = 2)
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/modify-axis-1.png" style="display: block; margin: auto;" />

Notes:

-   Notice how the axis title has been modified to "Price"
-   The breaks are at 0 and 10000
-   And the associated labels for the breaks are "0" and "More than
    10K". The "\n" in label is for starting a new line.

---

## Modifying labels

``` r
g + 
  scale_y_continuous(
    label = scales::dollar_format()
  )
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/modify-labels-1.png" style="display: block; margin: auto;" />

Notes:

-   Sometimes you may want to modify the labels based on it's existing
    axis label.
-   You can give a function to the label instead.
-   Most of the handy functions are in the `scales` package.

---

## Modifying legend scale

``` r
g + 
  scale_fill_continuous(
    breaks = c(0, 10, 100, 1000, 4000),
    trans = "log10"
  )
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/modify-legend-1.png" style="display: block; margin: auto;" />

Notes:

-   An axis is not just the x-axis and y-axis!
-   The legend can have an axis and we can modify its scale as well.
-   Here we identify the legend scale is `fill` and it's using a
    continuous scale.
-   We transform the scale into a `log10` format with breaks defined at
    0, 10, 100, 1000, and 4000.

---

## Removing legend

``` r
g + 
  scale_fill_continuous(
    guide = "none"
  )
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/remove-legend-1.png" style="display: block; margin: auto;" />

Notes:

-   If you want to remove a legend for an associated aesthetic, you can
    use `guide = "none"` in the associated scale.
-   There are other handy ways of doing this as well!

---

## Alternative control of guides

-   There are generally other ways of modifying the scales

``` r
g + 
  ylab("Price") + # Changes the y axis label
  labs(x = "Carat", # Changes the x axis label
       fill = "Count") # Changes the legend name
```

``` r
g + guides(fill = "none") # remove the legend
```

Notes:

-   Each user has a different mental mode, so you can use what suits you
    (and others in your team)

---

## Color

-   When using color in your plots, it's good to keep in mind that color
    can be viewed differently by people

<img src="chapter6_05_ggplot2scales_files/figure-markdown/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

Notes:

-   You can see how the plot in "Original" can be seen differently under
    different color deficient conditions (Protan, Deutan, Tritan).
-   If your goal is to use the plot for communicating, you may want to
    check how colorblind friendly your chosen palettes.

---

## Color palettes

-   There are a few different color palettes... choose what suits your
    purpose!

``` r
g + scale_fill_viridis_c(option = "A")
```

<img src="chapter6_05_ggplot2scales_files/figure-markdown/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

Notes:

-   The two primary ways to specify color in `ggplot` are through `fill`
    or `color` (or `colour`).
-   For every `color` scale, there is generally a corresponding `fill`
    scale, e.g. `scale_color_brewer()` and `scale_fill_brewer()`.

---

## Summary

-   Scales the control the mapping from data to aesthetics
-   Scales creates a **guide** that allows you to "read" the data from
    the plot.
-   Scales are primarily modified using `scale_` functions.
-   These include color (or fill).
-   There are many in-built color palettes that you can choose from but
    be wary to check how color blind friendly they are.
