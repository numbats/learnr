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
![](/tmp/Rtmp2PwGJ7/file5e2da77a85f61.png){height="0.7em"}.

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

### Behind the screen

`Knitr` covers `.Rmd` to `.md`. `rmarkdown` prepare the `.md` file and
use [Pandoc](https://pandoc.org) to convert `.md` to our destination
file output such as `.pdf` and `.html`.
