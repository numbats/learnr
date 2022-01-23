---
title: R Graphics
execute:
  keep-md: true
format: 
  revealjs:
    logo: images/monash-stacked-blue-rgb-transparent.png
    slide-number: true
    show-slide-number: all
    # below doesn't seem to be working
    #width: wide
type: slides
---




## Why data visualisation?

<blockquote>
A picture is worth a thousand words
</blockquote>

* Data visualisation is a powerful tool to **_explore_**, **_understand_** and **_communicate_** data

::: {.cell layout-align="center"}
::: {.cell-output-display}
![](images/chapter7-01/covid-plot-1.png){fig-align='center' width=960}
:::
:::


---

## Graphics

* Graphics are commonly stored in a standard image format such as svg, jpg, png, pdf, and so on. 
* When you view these graphics electronically, you would be using some graphical device to render the stored image. 
* R would render these using either `windows`, `X11` or `quartz` graphical devices (depending on the your operating system).
* This rendering is carried out by R's graphics engine, `grDevices`, which is one of the core package within the R system.



---

## Graphics model in R 

* There are two main graphics model in R through two core packages: 
    * `graphics` package, and
    * `grid` package.
* The `graphics` package is loaded when you launch R so there is no need to load this.
* Plot using the `graphics` system is normally refered to as the **base graphics**.
* If the graphics is produced using the `grid` package, then it is using the **`grid` graphics** model.

---

## Base graphics

* Base graphics are drawn via the `graphics` package.

![](images/base-graphics.png)

---

## Base graphics

* The `plot()` function usually produces base graphics.

::: {.cell layout-align="center" hash='cache/unnamed-chunk-2_f7f6623d067f725e90d478df8aa440b2'}

```{.r .cell-code}
x <- 1:10
plot(x, x^2)
```

::: {.cell-output-display}
![](images/chapter7-01/unnamed-chunk-2-1.png){fig-align='center' width=384}
:::
:::

---

## `grid` graphics

* The `grid` package contains low-level graphics system.
* This system gives a lot of control over the graphics, but requires the user to do a lot of work.
* You won't be directly interacting with the `grid` package most of the time.
* Instead you'll be using the `ggplot2` package that provides high-level functions for plotting via the `grid` system

---

## `grid` graphics


![](images/ggplot-graphics.png)


---

## R Graphics

![](images/r-graphics-system.png)

---

## Plotting with R (base version)
::: {.cell layout-align="center" hash='cache/unnamed-chunk-4_b1f50a5362742a332798a42cb523177e'}

```{.r .cell-code}
data <- data.frame(duty = c("Teaching", "Research", "Engagement"),
                   perc = c(40, 40, 20))
```
:::
::: columns

::: {.column width="25%"}

::: {.cell layout-align="center" hash='cache/unnamed-chunk-6_6b52aeb4b15d0c89ad476185744c44b8'}

```{.r .cell-code}
data
```

::: {.cell-output-stdout}
```
        duty perc
1   Teaching   40
2   Research   40
3 Engagement   20
```
:::
:::


:::
::: {.column width="60%"}

::: {.cell layout-align="center" hash='cache/base-barplot_74510a3b41632127615cf669b3cbb096'}

```{.r .cell-code}
barplot(perc ~ duty,
        data = data)
```

::: {.cell-output-display}
![](images/chapter7-01/base-barplot-1.png){fig-align='center' width=672}
:::
:::
:::

:::

---

## Plotting with R (ggplot2 version)
::: {.cell layout-align="center" hash='cache/unnamed-chunk-8_6300ada55e3f7e7d5404cf1cf21281a6'}

```{.r .cell-code}
data <- data.frame(duty = c("Teaching", "Research", "Engagement"),
                   perc = c(40, 40, 20))
```
:::
::: columns

::: {.column width="25%"}

::: {.cell layout-align="center" hash='cache/unnamed-chunk-10_1c5ecf1714ea2d830764bd16ce4a46de'}

```{.r .cell-code}
data
```

::: {.cell-output-stdout}
```
        duty perc
1   Teaching   40
2   Research   40
3 Engagement   20
```
:::
:::


:::
::: {.column width="60%"}

::: {.cell layout-align="center"}

```{.r .cell-code}
library(ggplot2)
ggplot(data = data, 
       mapping = aes(x = duty, 
                     y = perc)) +
  geom_col()
```

::: {.cell-output-display}
![](images/chapter7-01/ggplot-barplot-1.png){fig-align='center' width=672}
:::
:::
:::

:::

---


## A data visualisation catalogue

::: {.cell layout-align="center" hash='cache/datavis-catalogue_64a8320c71d8775c03b85214cd8be080'}

:::
::: {.cell layout-align="center" hash='cache/unnamed-chunk-12_c570cbafb5df51d18995b216d64fc7ad'}
<style type="text/css">
.catalogue img {
  margin-right: 20px;
  margin-top: 0px;
  margin-bottom: 0px;
  width: 18%;
}
</style>
:::

<div class="catalogue">
<img src="images/chapter7-01/datavis-catalogue-1.png"/><img src="images/chapter7-01/datavis-catalogue-2.png"/><img src="images/chapter7-01/datavis-catalogue-3.png"/><img src="images/chapter7-01/datavis-catalogue-4.png"/><img src="images/chapter7-01/datavis-catalogue-5.png"/><img src="images/chapter7-01/datavis-catalogue-6.png"/><img src="images/chapter7-01/datavis-catalogue-7.png"/><img src="images/chapter7-01/datavis-catalogue-8.png"/><img src="images/chapter7-01/datavis-catalogue-9.png"/><img src="images/chapter7-01/datavis-catalogue-10.png"/><img src="images/chapter7-01/datavis-catalogue-11.png"/><img src="images/chapter7-01/datavis-catalogue-12.png"/><img src="images/chapter7-01/datavis-catalogue-13.png"/><img src="images/chapter7-01/datavis-catalogue-14.png"/><img src="images/chapter7-01/datavis-catalogue-15.png"/>
</div>