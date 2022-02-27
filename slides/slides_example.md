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

``` {.r}
library(tidyverse)
mtcars %>% 
  ggplot(aes(x = factor(cyl), y = mpg)) + 
  geom_boxplot()
```

<img src="slides_example_files/figure-markdown/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

---

Math works too:

$$\dfrac{\beta}{\alpha}$$

You can also write math inline: \(\beta/\alpha\)
