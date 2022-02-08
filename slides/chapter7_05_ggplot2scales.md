---
title: Multiple layers in `ggplot2`
type: slides

---
## Scales

-   Scales control the mapping from **data** to aesthetics
-   They usually come in the format like below:

<center>
![](images/ggplot-scale.png)
</center>

    ggplot(diamonds, aes(carat, price)) +
      geom_point() + 
      scale_y_log10()

<img src="images/chapter7-04/scale-demo-1.png" style="display: block; margin: auto;" />

---

## Guide

-   The scale creates a **guide**: an **axis** or **legend**

<center>
![](images/guides-dissection.png)
</center>

-   So to modify these you generally use `scale_*` or other handy
    functions (e.g. `guides`, `labs`, `xlab`, `ylab`, and so on).

---

## Example plot

    g <- ggplot(diamonds, aes(carat, price)) + geom_hex()
    g

<img src="images/chapter7-04/example-1.png" style="display: block; margin: auto;" />

---

## Modifying axis

    g + 
      scale_y_continuous(name = "Price", 
                         breaks = c(0, 10000),
                         labels = c("0", "More\n than\n 10K")) + 
      geom_hline(yintercept = 10000, color = "red", size = 2)

<img src="images/chapter7-04/modify-axis-1.png" style="display: block; margin: auto;" />

---

## Modifying labels

    g + 
      scale_y_continuous(
        label = scales::dollar_format()
      )

<img src="images/chapter7-04/modify-labels-1.png" style="display: block; margin: auto;" />

---

## Modifying legend scale

    g + 
      scale_fill_continuous(
        breaks = c(0, 10, 100, 1000, 4000),
        trans = "log10"
      )

<img src="images/chapter7-04/modify-legend-1.png" style="display: block; margin: auto;" />

---

## Removing legend

    g + 
      scale_fill_continuous(
        guide = "none"
      )

<img src="images/chapter7-04/remove-legend-1.png" style="display: block; margin: auto;" />

---

## Alternative control of guides

-   There are generally other ways of modifying the scales
-   Each user has a different mental mode, so you can use what suits you
    (and others in your team)

<!-- -->

    g + 
      ylab("Price") + # Changes the y axis label
      labs(x = "Carat", # Changes the x axis label
           fill = "Count") # Changes the legend name

<img src="images/chapter7-04/change-labels-1.png" style="display: block; margin: auto;" />

    g + guides(fill = "none") # remove the legend

<img src="images/chapter7-04/remove-legend-alt-1.png" style="display: block; margin: auto;" />

---

## Color

-   When using color in your plots, it’s good to keep in mind that color
    can be viewed differently by people

<!-- -->

    ## Scale for 'fill' is already present. Adding another scale for 'fill', which will
    ## replace the existing scale.
    ## Scale for 'fill' is already present. Adding another scale for 'fill', which will
    ## replace the existing scale.
    ## Scale for 'fill' is already present. Adding another scale for 'fill', which will
    ## replace the existing scale.

<img src="images/chapter7-04/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />
