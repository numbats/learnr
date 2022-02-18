---
title: Publication ready plots with `ggplot2`
type: slides

---
## `theme`: modify the *look* of texts

<center>

<img src="images/ggplot-theme-text-annotation.png" width = "80%">

`element_text()`

</center>

Notes:

-   You can customise almost any aspect of `ggplot` object.
-   The customisation follows a certain consistent rule which makes it
    easier to remember how to customise the plot.

---

## `element_text()`

-   There are many text elements in a plot -- modify any part of it how
    you like it!

``` r
ggplot(diamonds, aes(carat, price)) + 
  geom_hex() +
 labs(title = "Diamond") +
 theme(axis.title.x = element_text(size = 30,
                                 color = "red",
                                 face = "bold",
                                 angle = 10,
                                 family = "Fira Code"),
       legend.title = element_text(size = 25,
                                   color = "#ef42eb", 
                                   margin = margin(b = 5)),
       plot.title = element_text(size = 35,
                                 face = "bold",
                                 family = "Nunito",
                                 color = "blue"
                                ))
```

Notes:

<img src="chapter6_07_ggplot2theme_files/figure-markdown/ele-text-1.png" style="display: block; margin: auto;" />

---

## `theme`: modify the *look* of the lines

<center>

<img src="images/ggplot-annotated-line-marks.png" width="70%">

`element_line()`
</center>

---

## `element_line()`

``` r
ggplot(diamonds, aes(carat, price)) + 
  geom_hex() +
 labs(title = "Diamond") +
 theme(axis.line.y = element_line(color = "black",
                                  size = 1.2,
                                  arrow = grid::arrow()),
       axis.line.x = element_line(linetype = "dashed", 
                                  color = "brown",
                                  size = 1.2),
       axis.ticks = element_line(color = "red", size = 1.1),
       axis.ticks.length = unit(3, "mm"),
       panel.grid.major = element_line(color = "blue", 
                                       size = 1.2),
       panel.grid.minor = element_line(color = "#0080ff",
                                       size = 1.2,
                                       linetype = "dotted"))
```

Notes:

<img src="chapter6_07_ggplot2theme_files/figure-markdown/ele-line-1.png" style="display: block; margin: auto;" />

-   If there's a line in the plot that's not data related, then it's
    generally controlled in the `theme` with `element_line()`.

---

## `theme`: modify the *look* of the <br>rectangular regions

<center>

<img src="images/ggplot-annotated-rect-marks.png" width = "40%">

`element_rect()`

</center>

---

## `element_rect()`

``` r
ggplot(diamonds, aes(carat, price)) + 
  geom_hex() +
 labs(title = "Diamond") +
 theme(
  legend.background = element_rect(fill = "#fff6c2", 
                                  color = "black",
                               linetype = "dashed"),
  legend.key = element_rect(fill = "grey", color = "brown"),
  panel.background = element_rect(fill = "#005F59",
                          color = "red", size = 3),
  panel.border = element_rect(color = "black", 
                              fill = "transparent",
                    linetype = "dashed", size = 3),
  plot.background = element_rect(fill = "#a1dce9",
                                color = "black",
                                 size = 1.3),
  legend.position = "bottom")
```

Notes:

<img src="chapter6_07_ggplot2theme_files/figure-markdown/ele-rect-1.png" style="display: block; margin: auto;" />

-   The selected colors don't make it a pretty plot but it's easier to
    distinguish between the different rectangular elements

---

## Professional-looking plots

-   You can make very pretty plots using `ggplot`.
-   Using code to draw plots has an advantage over making plots and
    editing the plot manually, e.g. using Adobe Illustrator -- your
    plots are easily reproducible!
-   Imagine that after you manually edit a plot, the data was updated --
    you'll have to redo your manual task from scratch again!
