---
title: 'Chapter 8: R Markdown basics'
description: This chapter will teach you the basics of R Markdown and how it can make
  your student life easlier.
prev: /chapter7
type: chapter
id: 8

---
<exercise id="1" title="Why do you want to use R Markdown">

## How R Markdown make your life easier

-   R Markdown allows you to create reproducible reports.

-   Help you organise your code in code chunk.

-   You can run python code in R. Or any other languages in R.

-   Rendering multiple files with a few line of code instead of copying
    and pasting all the time.

-   Support different files output including `html` and `pdf`.

-   And so much more.

</exercise>

<exercise id="2" title="Getting start with R Markdown" type = "slides">

<slides source="chapter8_01_gettingstart"> </slides>

</exercise>

<exercise id="3" title="R Chunk Options">

## Introduction to R Chunk

    ```{r, this-is-an-r-chunk}
    ```

Here is an example for R chunk. An R chunk starts with three
```` ```{r} ```` and ends with ```` ``` ````. After `r,` is where you
can name the code chunk. Notice that the code chunk name must not
include breaks.

### `include`

    ```{r, this-is-an-r-chunk,include = TRUE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()

<img src="chapter8_files/figure-markdown_strict/includeture-1.png" width="432" style="display: block; margin: auto;" />

The default setting is `include = FALSE`. When you set `include = TRUE`,
it will print out both code and results. Alternatively, if you wish not
to include the code and results from this R chunk, set
`include = FALSE`. R Markdown still runs the code and you can use the
results from this code chunk in other chunks.

### `echo`

    ```{r, this-is-an-r-chunk,echo = FALSE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

<img src="chapter8_files/figure-markdown_strict/unnamed-chunk-1-1.png" width="432" style="display: block; margin: auto;" />

The default setting is `echo = TRUE`. When you set `echo = FALSE`, it
will only print out the results from this code chunk but prevents code
from appearing in the finished file. This is a useful way to embed
figures.

### `eval`

The default setting is `eval = TRUE`. If you only want to print out the
code but not run the code, you can set `eval = FALSE`. This is helpful
when you are

### `message`, `warning`. `error`

    ```{r, this-is-an-r-chunk,messge = FALSE, warning = FALSE, error =  FALSE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

The defult setting is `message = TRUE, warning = TRUE, error = FALSE`.
When you are generating an assignment or report, you would not want to
include messages and warning to be printed out in the final outputs. Set
both `message = FALSE`, `warning = FALSE` and `error = FALSE` will
prevent messages and warnings to be printed out. When set
`error = FALSE`, `rmarkdown::render()` will halt on error in a code
chunk, and the error will be displayed in the R console. Both `messages`
and `warning` will also be displayed in the console.

### `cache`

    ```{r, this-is-an-r-chunk,cache = TRUE}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

The default setting is `cach = FALSE`. Everytime when you `Knit` a R
Markdown document, it will run through all the code chunks. When some of
your code chunk takes too much time to run or you don’t need to re-run
the code every time when you knit the document, you can set
`cache = TRUE` to loaded from previously saved databases (`.rdb` and
`.rdx` files). This means that this code chunk will only be evaluated
the first time you knit the document.

### `fig.width` and `fig.height`

    ```{r, this-is-an-r-chunk,fig.width = 4, fig.height =4}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()

<img src="chapter8_files/figure-markdown_strict/this-is-an-r-chunk-1.png" width="288" style="display: block; margin: auto;" />

The default setting is `fig.width =7,fig.height =7`. The figures are
defined in inches. `fig.width` defines the figure’s width where
`fig.height` defines the figure’s hight.

### `out.width` and `out.height`

    ```{r, this-is-an-r-chunk,out.width = '50%'}
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
    ```

    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()

<img src="chapter8_files/figure-markdown_strict/this-is-an-r-chunk-fig-1.png" width="50%" style="display: block; margin: auto;" />

You can also scale your output figures with `out.width` and
`out.height`. `out.width = '50%'` means 50% of the page width. You can
also scale by `out.height = '50%'` which means 50% of the page height.

</exercise>

<exercise id="4" title="Other useful tips for R Markdown">

## Insert website links to your R Markdown

You can add website links in your R Markdown using syntax:
`[Text](link)`. Inside `[]` is the text you want to display for the
hyperlink and the actual link goes into `()`.

## Insert pictures

There are two ways you can insert images/figures in your R Markdown
file.

-   `![alt text here](path-to-image-here)` the path to your image will
    be a relative path where you stored your images including file name.
    For example, `![R Markdown](images/rmarkdown.png)`

-   You could also use code chunk to include images.

<!-- -->

    ```{r, echo=FALSE, out.width="50%"}
    knitr::include_graphics("images/rmarkdown.png")
    ```

## You can make presentation slides using `R Markdown`

<img src="slides.png" width="50%" style="display: block; margin: auto;" />

You can select different `html` templates or you can use `pdf` outputs
for your presentations.

</exercise>

<exercise id="5" title="Additional Resources">

-   [R Markdown
    Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)

-   [R Markdown: The Definitive
    Guide](https://bookdown.org/yihui/rmarkdown/)

-   [R Markdown
    Cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)

-   [R Markdown from
    RStudio](https://rmarkdown.rstudio.com/lesson-1.html)

-   [Chunk options and package
    options](https://yihui.org/knitr/options/)

-   [Communicating with Data via R
    Markdown](https://rmd-combine-2019.netlify.app)

</exercise>
