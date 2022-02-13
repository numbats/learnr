---
title: Getting start with R Markdown
type: slides

---
### Installing packages

-   `install.pacakges("rmarkdown)`: need to install this package to use
    R Markdown

-   `install.packages("tinytex")`: install `tinytex` package for pdf
    output. After installing `tinytex`, run `tinytex::install_tinytex()`
    to install `TinyTeX`.

Note: Once you finish installing packages, you are ready to start your
journey with R Markdown.

---

### Start your very first R Markdown

You should see `R Markdown` when you click on
<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
<path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>.

<img src="images/chapter9/adding_rmd.png" width="70%" style="display: block; margin: auto;" />

---

<img src="images/chapter9/naming.png" width="70%" style="display: block; margin: auto;" />

Note: Once you clicked on `R Markdown`, you should see this pop-up
window. You can put in the title for your R Markdown and state the
author. You can also change this later. There are three default formate
for R Markdown including html,pdf and word. You can also change the
output file later.

---

<img src="images/chapter9/rmd-demo.png" width="70%" style="display: block; margin: auto;" />

Note: Once you clicked on `OK`, it will automatically generate an Rmd (R
Markdown) file with example. You can read through this demonstration
with examples. You can click on `Knit` (the blue ball of yarn) and it
will generate an html output file.

---

### R Markdown Basics

<img src="images/chapter9/demo-first-rmd.png" width="80%" style="display: block; margin: auto;" />

---

### Knitting: from `.Rmd` to `.html`

<img src="images/chapter9/demo-knit-html.png" width="80%" style="display: block; margin: auto;" />

---

### Knitting: from `.Rmd` to `.pdf`

<img src="images/chapter9/demo-knit-pdf.png" width="80%" style="display: block; margin: auto;" />

---

### Behind the sceen

`Knitr` covers `.Rmd` to `.md`. `rmarkdown` prepare the `.md` file and
use [Pandoc](https://pandoc.org) to convert `.md` to our destinate file
output such as `.pdf` and `.html`.
