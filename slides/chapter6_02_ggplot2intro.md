---
title: Getting started with `ggplot2`
type: slides

---
## What is `ggplot2`?

-   `ggplot2` is an R-package that was initially developed by Hadley
    Wickham as part of his PhD project.
-   `ggplot2` implements an interpretation of the "The Grammar of
    Graphics" by Leland Wilkinson.
-   It is one of the most popular packages in R for data visualisation
    and widely used in scientific outputs, reports, and even news
    articles.

Note:

-   Currently `ggplot2` is maintained by Thomas Lin Pedersen along with
    authors: Hadley Wickham, Winston Chang, Lionel Henry, Kohske
    Takahashi, Claus Wilke, Kara Woo, Hiroaki Yutani and Dewey
    Dunnington.
-   `ggplot2` is an open-source tool so you can find all code for this
    at <https://github.com/tidyverse/ggplot2>
-   There are over 250 contributors to the package.
-   Fun fact: Professor Dianne Cook at Monash University was the PhD
    supervisor of Hadley Wickham when she was still at Iowa State
    University.

---

## Installing and loading `ggplot2`

-   To use `ggplot2`, you first have to install the package

``` {.r}
install.packages("ggplot2")
```

-   Once you have installed it, you can load the package:

``` {.r}
library(ggplot2)
```

-   `ggplot2` is part of the `tidyverse` family so if you load
    `tidyverse`, you don't need to load `ggplot2` like above

``` {.r}
library(tidyverse)
```

Note:

-   You can find more about `tidyverse` at <https://www.tidyverse.org/>
-   If you use `library(tidyverse)`, it loads 8 packages:
    -   `ggplot2`
    -   `tibble`
    -   `tidyr`
    -   `readr`
    -   `purrr`
    -   `dplyr`
    -   `stringr`
    -   `forcats`

---

## Basic structure of `ggplot`

![](images/ggplot-basic-str.png)

1.  **data** as `data.frame`
2.  a set of **aesthetic** mappings between variables in the data and
    visual properties
3.  at least one **layer** which describes how to render each
    observation

Note:

-   The layer usually is function starting with `geom_` or `stat_`.

---

## Illustrative data 💰 Wages

-   Let's look at a survey of average hourly earnings in United States
    where each observation is an individual.

``` {.r}
data(CPSch3, package = "Ecdat")
str(CPSch3)
```

    ## 'data.frame':    11130 obs. of  3 variables:
    ##  $ year: int  1992 1992 1992 1992 1992 1992 1992 1992 1992 1992 ...
    ##  $ ahe : num  13 11.6 17.4 10.1 16.8 ...
    ##  $ sex : Factor w/ 2 levels "male","female": 1 1 1 2 1 2 2 1 1 1 ...

Note:

-   Let's use a data to illustrate the different layers in `ggplot2`.
-   This data contains:
    -   `year` = the survey year
    -   `ahe` = the average hourly earnings
    -   `sex` = the sex (male or female)

---

## Initialising the plot

``` {.r}
ggplot(data = CPSch3) 
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/plot-initial-1.png" style="display: block; margin: auto;" />

-   When there is no layer, it produces a blank layer (`geom_blank()`)
    like the above plot.

Note:

This graph isn't really useful.

---

## Mapping data variables to aesthetics

``` {.r}
ggplot(data = CPSch3,
       mapping = aes(x = sex, y = ahe)) 
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/plot-mapping-1.png" style="display: block; margin: auto;" />

-   This get the scale ready but no layer is defined so nothing is
    rendered in the panel.

Note:

Notice that the scales are automatically setup based on the data -- less
work for you to do in plotting the data.

---

## Layers

-   Each layers have five main components:
    -   `geom` - the geometric object to use display the data
    -   `stat` - statistical transformation to use on the data
    -   `data` - data to be displayed in this layer (usually inherited)
    -   `mapping` - aesthetic mappings (usually inherited)
    -   `position` - position adjustment

Note:

-   Most layer functions you use will start with `geom_`.

---

## Distribution of a single variable

<style>
.catalogue { 
  margin: 0!important; 
  width: 18%!important;
  margin-right: 2%!important;
}
</style>

<img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-1.png"/><img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-2.png"/><img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-3.png"/><img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-4.png"/><img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-5.png"/><img class="catalogue" src="chapter6_02_ggplot2intro_files/figure-markdown/catalogue-single-6.png"/>

Note:

-   Distribution of a single *continuous* variable can be studied with
    **histogram**, **density or frequency plot**, **boxplot**, **violin
    plot** or **dot plot**.
-   If you have a discrete or categorical variable, you may like to
    study this using a **barplot** (or sometimes called barchart).
-   We'll go through how to create these layers in `ggplot2` next.

---

## A histogram with `geom_histogram()`

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_histogram() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-histogram-1.png" style="display: block; margin: auto;" />

Note:

-   By default `ggplot2` uses 30 bins (`bins = 30`) when drawing
    histograms.
-   It is often a good idea to try different number of bins (`bins`) or
    different bin widths (`binwidth`) to see how the **shape** of the
    histogram changes.
-   Here we can see that the distribution for the average hourly
    earnings are slightly right skewed.
-   The mode average hourly earning looks like it's about US\$14.
-   To find more about how to change parameters of the layer, have a
    look at the corresponding documentation (`?geom_histogram`).

---

## Layer data

``` {.r}
g <- ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_histogram() 
layer_data(g, 1)
```

    ##       y count         x       xmin      xmax      density      ncount
    ## 1    19    19  1.734720  0.8673601  2.602080 0.0009840768 0.014011799
    ## 2    91    91  3.469440  2.6020802  4.336800 0.0047132101 0.067109145
    ## 3   255   255  5.204160  4.3368004  6.071521 0.0132073470 0.188053097
    ## 4   514   514  6.938881  6.0715206  7.806241 0.0266218681 0.379056047
    ## 5   760   760  8.673601  7.8062407  9.540961 0.0393630735 0.560471976
    ## 6  1143  1143 10.408321  9.5409609 11.275681 0.0591999908 0.842920354
    ## 7  1356  1356 12.143041 11.2756811 13.010401 0.0702320101 1.000000000
    ## 8  1232  1232 13.877761 13.0104012 14.745121 0.0638096139 0.908554572
    ## 9  1137  1137 15.612481 14.7451214 16.479842 0.0588892297 0.838495575
    ## 10  941   941 17.347202 16.4798416 18.214562 0.0487377002 0.693952802
    ## 11  798   798 19.081922 18.2145617 19.949282 0.0413312272 0.588495575
    ## 12  749   749 20.816642 19.9492819 21.684002 0.0387933448 0.552359882
    ## 13  497   497 22.551362 21.6840021 23.418722 0.0257413783 0.366519174
    ## 14  428   428 24.286082 23.4187222 25.153442 0.0221676256 0.315634218
    ## 15  279   279 26.020802 25.1534424 26.888163 0.0144503915 0.205752212
    ## 16  249   249 27.755523 26.8881625 28.622883 0.0128965859 0.183628319
    ## 17  186   186 29.490243 28.6228827 30.357603 0.0096335943 0.137168142
    ## 18  148   148 31.224963 30.3576029 32.092323 0.0076654406 0.109144543
    ## 19  101   101 32.959683 32.0923230 33.827043 0.0052311453 0.074483776
    ## 20   66    66 34.694403 33.8270432 35.561763 0.0034183722 0.048672566
    ## 21   40    40 36.429123 35.5617634 37.296484 0.0020717407 0.029498525
    ## 22   48    48 38.163844 37.2964835 39.031204 0.0024860889 0.035398230
    ## 23   29    29 39.898564 39.0312037 40.765924 0.0015020120 0.021386431
    ## 24   20    20 41.633284 40.7659239 42.500644 0.0010358704 0.014749263
    ## 25   15    15 43.368004 42.5006440 44.235364 0.0007769028 0.011061947
    ## 26   13    13 45.102724 44.2353642 45.970084 0.0006733157 0.009587021
    ## 27    6     6 46.837444 45.9700844 47.704805 0.0003107611 0.004424779
    ## 28    3     3 48.572165 47.7048045 49.439525 0.0001553806 0.002212389
    ## 29    5     5 50.306885 49.4395247 51.174245 0.0002589676 0.003687316
    ## 30    2     2 52.041605 51.1742448 52.908965 0.0001035870 0.001474926
    ##       ndensity flipped_aes PANEL group ymin ymax colour   fill size linetype
    ## 1  0.014011799       FALSE     1    -1    0   19     NA grey35  0.5        1
    ## 2  0.067109145       FALSE     1    -1    0   91     NA grey35  0.5        1
    ## 3  0.188053097       FALSE     1    -1    0  255     NA grey35  0.5        1
    ## 4  0.379056047       FALSE     1    -1    0  514     NA grey35  0.5        1
    ## 5  0.560471976       FALSE     1    -1    0  760     NA grey35  0.5        1
    ## 6  0.842920354       FALSE     1    -1    0 1143     NA grey35  0.5        1
    ## 7  1.000000000       FALSE     1    -1    0 1356     NA grey35  0.5        1
    ## 8  0.908554572       FALSE     1    -1    0 1232     NA grey35  0.5        1
    ## 9  0.838495575       FALSE     1    -1    0 1137     NA grey35  0.5        1
    ## 10 0.693952802       FALSE     1    -1    0  941     NA grey35  0.5        1
    ## 11 0.588495575       FALSE     1    -1    0  798     NA grey35  0.5        1
    ## 12 0.552359882       FALSE     1    -1    0  749     NA grey35  0.5        1
    ## 13 0.366519174       FALSE     1    -1    0  497     NA grey35  0.5        1
    ## 14 0.315634218       FALSE     1    -1    0  428     NA grey35  0.5        1
    ## 15 0.205752212       FALSE     1    -1    0  279     NA grey35  0.5        1
    ## 16 0.183628319       FALSE     1    -1    0  249     NA grey35  0.5        1
    ## 17 0.137168142       FALSE     1    -1    0  186     NA grey35  0.5        1
    ## 18 0.109144543       FALSE     1    -1    0  148     NA grey35  0.5        1
    ## 19 0.074483776       FALSE     1    -1    0  101     NA grey35  0.5        1
    ## 20 0.048672566       FALSE     1    -1    0   66     NA grey35  0.5        1
    ## 21 0.029498525       FALSE     1    -1    0   40     NA grey35  0.5        1
    ## 22 0.035398230       FALSE     1    -1    0   48     NA grey35  0.5        1
    ## 23 0.021386431       FALSE     1    -1    0   29     NA grey35  0.5        1
    ## 24 0.014749263       FALSE     1    -1    0   20     NA grey35  0.5        1
    ## 25 0.011061947       FALSE     1    -1    0   15     NA grey35  0.5        1
    ## 26 0.009587021       FALSE     1    -1    0   13     NA grey35  0.5        1
    ## 27 0.004424779       FALSE     1    -1    0    6     NA grey35  0.5        1
    ## 28 0.002212389       FALSE     1    -1    0    3     NA grey35  0.5        1
    ## 29 0.003687316       FALSE     1    -1    0    5     NA grey35  0.5        1
    ## 30 0.001474926       FALSE     1    -1    0    2     NA grey35  0.5        1
    ##    alpha
    ## 1     NA
    ## 2     NA
    ## 3     NA
    ## 4     NA
    ## 5     NA
    ## 6     NA
    ## 7     NA
    ## 8     NA
    ## 9     NA
    ## 10    NA
    ## 11    NA
    ## 12    NA
    ## 13    NA
    ## 14    NA
    ## 15    NA
    ## 16    NA
    ## 17    NA
    ## 18    NA
    ## 19    NA
    ## 20    NA
    ## 21    NA
    ## 22    NA
    ## 23    NA
    ## 24    NA
    ## 25    NA
    ## 26    NA
    ## 27    NA
    ## 28    NA
    ## 29    NA
    ## 30    NA

Note:

-   A histogram by default shows the **count** on the y-axis.
-   `ggplot2` calculates other useful statistics as well (seen using
    `layer_data`) and sometimes you want to use these instead.

---

## Layer data

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_histogram(aes(y = after_stat(density))) 
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-histogram-density-1.png" style="display: block; margin: auto;" />

Note:

-   In this plot, the y-axis is showing density instead of count.
-   This is signalled by using `y = after_stat(density)`.
-   This syntax is equivalent to `y = stat(density)` or
    `y = ..density..`, which was the old syntax to refer to computed
    statistics.

---

## A density plot with `geom_density()`

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_density() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-density-1.png" style="display: block; margin: auto;" />

Note:

-   A density plot is like a histogram where it reveals the distribution
    of a (continuous) numerical variable.
-   The y-axis is showing the density, which is estimated using a
    particular kernel function.
-   The estimated density can oversmooth or have problems in the tails
    -- so don't only rely on density plots to tell you the full picture
    of the data.

---

## A frequency polygon with `geom_freqpoly()`

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_freqpoly() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-freqpoly-1.png" style="display: block; margin: auto;" />

Note:

-   The default `geom_freqpoly` is showing the same statistic
    (`stat = "bin"`) as the default `geom_histogram` except one is using
    a bar (`geom = "bar"`) and the other is using a line
    (`geom = "path"`).

---

## A boxplot with `geom_boxplot()`

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe)) +
  geom_boxplot() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-boxplot-1.png" style="display: block; margin: auto;" />

Note:

-   A boxplot depicts graphically the five number summary: minimum,
    first quartile, median, third quartile and maximum.
-   `geom_boxplot` is also useful in comparing distributions of multiple
    numerical variables, like below, where each variable corresponds to
    one boxplot.

<img src="chapter6_02_ggplot2intro_files/figure-markdown/boxplot-multiple-1.png" style="display: block; margin: auto;" />

---

## A violin plot with `geom_violin()`

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = ahe, y = "")) +
  geom_violin() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-violin-1.png" style="display: block; margin: auto;" />

Note:

-   A dummy is required for `y` here!
-   A violin plot depicts a density estimate of a continuous variable.

---

## A dotplot with `geom_dotplot()`

``` {.r}
ggplot(data = dplyr::sample_n(CPSch3, 200), 
       mapping = aes(x = ahe)) +
  geom_dotplot() +
  labs(x = "Average hourly earnings (US$)")
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-dotplot-1.png" style="display: block; margin: auto;" />

Note:

-   A dotplot works best for small number of observations so this plot
    is based on 200 random samples of the data.

---

## A barplot with `geom_bar()` with categorical variables

``` {.r}
ggplot(data = CPSch3, 
       mapping = aes(x = sex)) +
  geom_bar()
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-bar-1.png" style="display: block; margin: auto;" />

Note:

-   If you have a categorical variable, then you usually want to study
    the frequency of its categories.
-   Notice here that the `stat = "count"` is computing the frequencies
    for each category for you.

---

## A barplot with `geom_bar()` with discrete variables

``` {.r}
ggplot(data = filter(CPSch3, year!=1994), 
       mapping = aes(x = year)) +
  geom_bar()
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-bar2A-1.png" style="display: block; margin: auto;" />

Note:

-   If you supply a numerical variable, you can see now that the x-axis
    scale is continuous.
-   The years are 2 years apart -- I filtered out 1994 on purpose so
    that it's easier to see the distance between bars are determined by
    the numerical value.
-   If you want to study each level in a discrete variable, then you may
    want to convert the discrete variable to a factor instead
    `x = factor(year)`.

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-bar2B-1.png" style="display: block; margin: auto;" />

-   When the variable is a factor or character, the distances between
    the bars are equal and the labels correspond to that particular
    level.

---

## A barplot with `geom_col()`

``` {.r}
dfsum <- CPSch3 %>% group_by(sex) %>% tally()
dfsum
```

    ## # A tibble: 2 × 2
    ##   sex        n
    ##   <fct>  <int>
    ## 1 male    5956
    ## 2 female  5174

``` {.r}
ggplot(data = dfsum, 
       mapping = aes(x = sex, y = n)) +
  geom_col()
```

<img src="chapter6_02_ggplot2intro_files/figure-markdown/geom-col-1.png" style="display: block; margin: auto;" />

Note:

-   `tally()` is just a shorthand for `summarise(n = n())`.
-   Sometimes your input data may already contain pre-computed counts.
-   In this case, you don't need `stat = "count"` to do the counting for
    you.
-   You can use `geom_col()` instead.
-   This is essential a short hand for `geom_bar(stat = "identity")`
    where `stat = "identity"` means that you will take the value as
    supplied without any statistical transformation.

---

## Modifying the layer parameters

-   Layers often have default parameter values.
-   E.g. in the frequency polygon, the default is to have `bins = 30`.
-   It's important to modify the parameters values appropriately
-   More **details about the parameters of a layer is in the
    documentation** of the corresponding function, e.g. `?geom_freqpoly`
    to see the help file on the histogram layer.

---

## Summary

-   We looked at the basic code structure to draw a plot with `ggplot2`.
-   You've seen now the layers: `geom_histogram()`, `geom_density()`,
    `geom_freqpoly()`, `geom_boxplot()`, `geom_violin()`,
    `geom_dotplot()`, `geom_bar()`, and `geom_col()`.
-   You can look at the statistics computed by `ggplot` by using
    `layer_data()` and if you want to use these, you can use
    `after_stat()`.
