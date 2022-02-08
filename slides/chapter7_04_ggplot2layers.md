---
title: Multiple layers in `ggplot2`
type: slides

---
## Layer

-   A layer is usually added using functions with prefix `geom_` and
    `stat_`
-   A layer is comprised of:
    -   `data`
    -   `mapping`
    -   statistical tranformation (`stat`)
    -   geometric object (`geom`)
    -   position adjustment (`position`)
-   `data` and `mapping` are often inherited from `ggplot`

## The boxplot layer

    ggplot(data = diamonds,
           mapping = aes(x = cut, y = price)) +
      geom_boxplot()

<img src="images/chapter7-04/plot1-cut-1.png" style="display: block; margin: auto;" />

---

## You can add more than one layer

    ggplot(data = diamonds,
           mapping = aes(x = cut, y = price)) +
      geom_violin() + 
      geom_boxplot(width = 0.1)

<img src="images/chapter7-04/plot1-layer2-1.png" style="display: block; margin: auto;" />

---

## The order of the layer matters

    ggplot(data = diamonds,
           mapping = aes(x = cut, y = price)) +
      geom_boxplot(width = 0.1) +
      geom_violin()

<img src="images/chapter7-04/plot1-layer-order-1.png" style="display: block; margin: auto;" />

---

## Inheriting data and mapping

-   A layer inherits the data and mapping from the initialised ggplot
    object by default

![](images/ggplot-multiple-layers.png)

---

## Layer-specific data and aesthetic mapping

![](images/ggplot-multiple-layers-data-mapping.png)

-   For each layer, aesthetic and/or data can be overwritten

---

    ggplot(data = diamonds) +
      geom_violin(aes(x = cut, y = price, color = cut)) + 
      geom_boxplot(aes(x = cut, y = price),
                   width = 0.1)

<img src="images/chapter7-04/plot2-inheritance-1.png" style="display: block; margin: auto;" />

---

## Aesthetic or Attribute?

Not what you want:

    ggplot(diamonds, aes(carat, price)) +
      geom_point(aes(color = "blue"))

<img src="images/chapter7-04/aes-map-1.png" style="display: block; margin: auto;" />

What you want:

    ggplot(diamonds, aes(carat, price)) +
      geom_point(color = "blue")

<img src="images/chapter7-04/attr-map-1.png" style="display: block; margin: auto;" />

---

## Bonus tip

-   Use `I()` operator to mean “as-is” in aesthetic mapping.

<!-- -->

    ggplot(diamonds, aes(carat, price)) +
      geom_point(aes(color = I("blue")))

<img src="images/chapter7-04/I-map-1.png" style="display: block; margin: auto;" />
