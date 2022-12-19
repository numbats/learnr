---
title: 'Chapter 9: Quarto basics'
description: Quarto is the next generation R Markdown. This chapter teaches the difference
  between Quarto and R Markdown, and the basic use of Quarto.
prev: /chapter8
type: chapter
id: 9

---
<exercise id="1" title="What is Quarto?">

-   Quarto is an open-source scientific and technical publishing system
    built on Pandoc.
-   Quarto can be considered the **next generation R Markdown**, where
    you interweave your narrative text and code together, except Quarto
    has no dependency on R and designed from the grounds up to be
    multilingual.
-   Quarto is relatively new, with the **first version released in July
    2022**, so you may not find as many examples in the wild.

</exercise>

<exercise id="2" title="Why Quarto?">

-   R Markdown and Quarto are both products maintained by Posit PBC
    (formerly RStudio PBC). Quarto has been designed from the grounds up
    after years of experience by the Posit/RStudio team.
-   **Quarto unifies some disparate, and sometimes inconsistent,
    elements built within the R Markdown ecosystem into a common
    standard without the dependence on R.** For example,
    `rmarkdown::html_document` converted R Markdown to an HTML document,
    but `bookdown::html_document2` was needed for figure and table
    numbering, `blogdown` or `distill` to create certain types of
    websites, and `xaringan` or `revealjs` for creating slides. Not all
    packages (e.g. `xaringan`) used Pandoc under the hood, therefore
    some Pandoc features were not available.
-   It's likely that the Posit team will invest more into developing
    Quarto so new features will mostly reside there instead of R
    Markdown.

</exercise>

<exercise id="3" title="Should you learn R Markdown?">

-   Yes, it's still worthwhile learning R Markdown!
-   There are still far more documents available in R Markdown than in
    Quarto, and so you'll come across more examples in R Markdown.
-   Even if you switch to Quarto, there will be many who will continue
    to stick with (legacy) R Markdown documents. You'll need to
    occasionally read these, so being fluent in R Markdown helps.
-   There will be cases where learning R Markdown is not essential. In a
    similar vein, knowing how to use
    [LaTeX](https://www.latex-project.org/) is also helpful, but not
    essential, for PDF document outputs.

</exercise>

<exercise id="4" title="Transitioning from R Markdown to Quarto">

-   The file extension of a Quarto document is `.qmd` while the file
    extension of an R Markdown document is `.Rmd`.

-   A Quarto document is quite similar to R Markdown document with YAML
    to specify the document metadata and specifications, body to write
    narrative text and code, and code chunks with a variety of options.
    However, **Quarto documents are not backward nor forward compatible
    as R Markdown documents**. This means that changing the extension
    from `.qmd` to `.Rmd`, and vice versa, doesn't work.

## Key changes in YAML

-   `output` is now `format`
-   `self_contained` is now `embed-resources`
-   No more `_`s; most keys now use `-` instead of `_`. E.g. `keep_md`
    is now `keep-md`.
-   Global chunk options, previously set by `knitr::opts_chunk$set()`,
    can now be set in the YAML under the top level YAML key `execute`.
    For example, `knitr::opts_chunk$set(eval = FALSE, echo = FALSE)` can
    be set in the YAML as:

``` markdown
---
execute: 
  eval: false
  echo: false
---
```

-   Not all chunk options are under `execute`. For example, `fig.width`
    and `fig.height` are set under specific formats like below. Notice
    that the `.` in the chunk option names are now replaced with `-`.

``` markdown
---
format: 
  html:
    fig-width: 8
    fig-height: 6
  pdf:
    fig-width: 7
    fig-height: 5
---
```

-   If you are using `knitr` engine, then you can specify the chunk
    options under it like below:

``` markdown
---
knitr:
  opts_chunk: 
    collapse: true
---
```

## Key changes in code chunk options

-   As mentioned in the previous section, the global chunk options can
    be set in the YAML under the top level YAML key `execute`. You can
    still use `knitr::opts_chunk$set()` for `knitr` engine.
-   The `results` option is replaced as `output`.
-   There is an additional caching method with `freeze`.
-   Chunk options can (and in fact, preferably) be set within the chunk
    by prefixing with `#|` like below.

```` markdown
```{r}
#| echo: true
#| eval: true
2 + 2
```
````

</exercise>

<exercise id="5" title="Additional Resource">

Currently, the single best guide for Quarto is at
[quarto.org](https://quarto.org/).

</exercise>
