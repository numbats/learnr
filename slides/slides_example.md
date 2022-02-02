---
title: Example slides
type: slides

---
## Example slides

Here are some slides. You can use these to demonstrate the concept
before testing their understanding with tasks.

Focus on content, not style when writing the slides to achieve a uniform
design.

To separate content onto the next slide, use `---` on a new line.

---

In slides you can provide R code examples;

    library(tidyverse)

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5.9000     ✓ purrr   0.3.4     
    ## ✓ tibble  3.1.6          ✓ dplyr   1.0.7     
    ## ✓ tidyr   1.1.4          ✓ stringr 1.4.0     
    ## ✓ readr   2.0.2          ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    mtcars %>% 
      ggplot(aes(x = factor(cyl), y = mpg)) + 
      geom_boxplot()

![](slides_example_files/figure-markdown_strict/unnamed-chunk-1-1.png)
