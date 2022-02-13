---
title: R Chunk Settings
type: slides

---
### Introduction to R Chunk

    ```{r, this-is-an-r-chunk}
    ```

Here is an example for R chunk. An R chunk starts with three
```` ```{r} ```` and ends with ```` ``` ````. After `r,` is where you
can name the code chunk. Notice that the code chunk name must not
include breaks.

---

### `include`

    ```{r, this-is-an-r-chunk,include = TRUE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()

<img src="images/chapter9/includeture-1.png" style="display: block; margin: auto;" />

Note: When you set `include = TRUE`, it will print out both code and
results. Alternatively, if you wish not to include the code and results
from this R chunk, set `include = FALSE`. R Markdown still runs the code
and you can use the results from this code chunk in other chunks.

---

### `echo`

    ```{r, this-is-an-r-chunk,echo = FALSE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

<img src="images/chapter9/echofalse-1.png" style="display: block; margin: auto;" />
