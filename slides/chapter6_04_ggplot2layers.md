---
title: Multiple layers in `ggplot2`
type: slides

---
## Layer

-   A layer is comprised of:
    -   `data`
    -   `mapping`
    -   statistical tranformation (`stat`)
    -   geometric object (`geom`)
    -   position adjustment (`position`)
-   `data` and `mapping` are often inherited from `ggplot`

Notes:

-   A layer is usually added using functions with prefix `geom_` and
    `stat_`
-   Technically, there are more components but we won't go into those.

---

## The violin plot layer

``` r
ggplot(data = diamonds,
       mapping = aes(x = cut, y = price)) +
  geom_violin()
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/plot1-cut-1.png" style="display: block; margin: auto;" />

Notes:

-   There is one layer in this plot comprising of:
    -   inherited `data`: `diamonds`
    -   inherited `mapping`: `aes(x = cut, y = price)`
    -   `geom`: violin
    -   `stat`: density for the y-axis (`ydensity`)
    -   `position`: dodge
-   You don't see `position = "dodge"` much in action here because there
    is only one group for each level of x.

---

## You can add more than one layer

``` r
ggplot(data = diamonds,
       mapping = aes(x = cut, y = price)) +
  geom_violin() + 
  geom_boxplot(width = 0.1)
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/plot1-layer2-1.png" style="display: block; margin: auto;" />

Notes:

-   We now have the boxplot layer on top of the violin plot layer.

---

## The order of the layer matters

``` r
ggplot(data = diamonds,
       mapping = aes(x = cut, y = price)) +
  geom_boxplot(width = 0.1) +
  geom_violin()
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/plot1-layer-order-1.png" style="display: block; margin: auto;" />

Notes:

-   You can't see the boxplot here because it's been hidden by the
    violin plot.

---

## Inheriting data and mapping

-   A layer inherits the data and mapping from the initialised ggplot
    object by default

<center>
<img src= "images/ggplot-multiple-layers.png" width="70%">
</center>

---

## Layer-specific data and aesthetic mapping

![](images/ggplot-multiple-layers-data-mapping.png)

-   For each layer, aesthetic and/or data can be overwritten

---

## Overwriting data and aesthetic

``` r
library(dplyr) # needed for data wrangling
ggplot(data = diamonds, aes(x = cut, y = price)) +
  geom_violin(aes(fill = cut)) + 
  geom_boxplot(width = 0.1) +
  geom_text(data = function(data) data %>% 
              group_by(cut) %>% 
              tally(),
            aes(y = 0, label = n), nudge_y = -0.2)
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/plot2-inheritance-1.png" style="display: block; margin: auto;" />

Notes:

-   You can see that `fill` is only applied the violin plot.
-   For text layer shows the the total number of observations on the
    bottom of the violin plot. This display requires a summarised data
    of the inherited data.
-   The input `data` for each subsequent layer can be a `data.frame` or
    a function. If it's a function it's applied to the data that it
    inherited -- it's handy for cases like this where you want to use
    the summarised or processed form of the inherited data!

---

## Aesthetic or Attribute?

*Not* what you want:

``` r
ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(color = "dodgerblue"))
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/aes-map-1.png" style="display: block; margin: auto;" />

Notes:

-   When you supply values within `aes`, it assumes that it's a data
    variable.
-   The string `"dodgerblue"` gets converted into a variable with one
    level and it gets colored by `ggplot`'s default color palette.

---

## When your input is an attribute

Don't put attributes inside `aes()`!

``` r
ggplot(diamonds, aes(carat, price)) +
  geom_point(color = "dodgerblue")
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/attr-map-1.png" style="display: block; margin: auto;" />

---

## Bonus tip

-   Use `I()` operator to mean "as-is" in aesthetic mapping.

``` r
ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(color = I("dodgerblue")))
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/I-map-1.png" style="display: block; margin: auto;" />

---

## Attributes are for layers

-   Attributes should be defined in specific layers.

``` r
ggplot(diamonds, aes(carat, price),
       color = "dodgerblue") +
  geom_point()
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/attr-in-ggplot-1.png" style="display: block; margin: auto;" />

Notes:

-   Notice how the points don't have the "dodgeblue" color.
-   Layers inherit data and the mapping from `ggplot()` but not
    attributes like this.

---

## Annotation layer

-   `annotate()` allows you to add elements to plots without a
    `data.frame`

``` r
ggplot(diamonds, aes(color, fill = cut)) +
  geom_bar(color = "black") + 
  annotate("text", x = "I", y = 9000, 
           label = paste(nrow(diamonds), "diamonds"))
```

<img src="chapter6_04_ggplot2layers_files/figure-markdown/annotate-1.png" style="display: block; margin: auto;" />

Notes:

-   `annotate()` is useful if you want to add small annotations to plot
    and it's too cumbersome for you to put the data as a `data.frame`

---

## Summary

-   We've seen how you can add multiple layers in `ggplot`.
-   You can define layer-specific data or mappings.
-   An attribute of a graphical parameter must be placed outside of
    `aes()` in the correpsonding layer.
-   You can add the annotation layer using `annotate()`.
