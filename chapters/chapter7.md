---
title: 'Chapter 7: Data Visualisation with R'
description:
  'This chapter will give you an introduction to the R graphics system and teach you how to get started with using the `ggplot2` package for drawing all kind of plots.'
prev: /chapter6
next: /chapter8
type: chapter
id: 7
output:
  html_document:
    self_contained: false
  #md_document
---







<style>
.target {
  border: 3px solid black;
  padding: 10px;
  padding-top: 35px;
  margin-bottom: 10px;
}
.target:before {
  position: absolute;
  content: "🎯 your target plot";
  padding: 5px;
  margin-left: -13px;
  margin-top: -38px;
  background-color: #003366;
  font-size: 12pt;
  border: 3px solid black;
  color: white;
}
</style>


<exercise id="1" title="R Graphics" type="slides">

<slides source="chapter7_01_rgraphics">
</slides>

</exercise>

<exercise id="2" title="Test your knowledge of R Graphics">

Which of the following is a contributed R package?

<choice>

<opt text="ggplot2" correct="true">

That's correct! ggplot2 was developed by Hadley Wickham as part of his PhD.

</opt>

<opt text="grid" >

No, this is a core package so it's already installed.

</opt>

<opt text="graphics" >

No, this a core package and loads automatically when you launch R.

</opt>

<opt text="grDevices" >

No, this a core package and loads automatically when you launch R.

</opt>

</choice>

Which R package actually renders the graphics in R?

<choice>

<opt text="ggplot2" >

No, that's incorrect.

</opt>

<opt text="grid" >

No, that's incorrect.

</opt>

<opt text="graphics" >

No, that's incorrect.

</opt>

<opt text="grDevices" correct="true">

Yes, that's right!

</opt>

</choice>

Remember that there are two primary graphic models in R: the base and grid graphics. Which one is `ggplot2` using?

<choice>

<opt text="base" >

No, that's incorrect.

</opt>

<opt text="grid" correct="true">

Yes that's right! Well done!

</opt>

</choice>


</exercise>



<exercise id="3" title="Getting started with `ggplot2`" type="slides">

<slides source="chapter7_02_ggplot2intro">
</slides>

</exercise>


<exercise id="4" title="Make basic plots with `ggplot2`">

For the following questions we are going to use `BudgetFood` data from the `Ecdat` package which contains the budget share of food for Spanish households. You can load the dataset and see the structure of the data below.


```r
library(Ecdat)
```

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```r
str(BudgetFood)
```

```
## Error in str(BudgetFood): object 'BudgetFood' not found
```
The meaning of the variables are described below:

* `wfood`: percentage of total expenditure which the household has spent on food
* `totexp`: total expenditure of the household
* `age`: age of reference person in the household
* `size`: size of the household
* `town`: size of the town where the household is placed categorized into 5 groups: 1 for small towns, 5 for big ones
* `sex`: sex of reference person (man,woman)

Try to recreate the scatter plot below. Is there anything that unusual that you notice about the plot?

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = size, y = totexp)): object 'BudgetFood' not found
```

</div>

<codeblock id="07_04A">

</codeblock>

<codeblock id="07_04A">
The scatter plots are created using `geom_point`.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = size, y = totexp)): object 'BudgetFood' not found
```

</div>

<codeblock id="07_04B">

</codeblock>

<codeblock id="07_04B">
The hex plots are created using `geom_hex`.
</codeblock>


<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = sex, y = age)): object 'BudgetFood' not found
```

</div>

<codeblock id="07_04C">

</codeblock>

<codeblock id="07_04C">
This is a hint.
</codeblock>


<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = factor(town), y = totexp)): object 'BudgetFood' not found
```

</div>

<codeblock id="07_04D">

</codeblock>
<codeblock id="07_04D">
This is a hint.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = wfood)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_04E">

</codeblock>
<codeblock id="07_04E">
This is a hint.
</codeblock>


<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = wfood)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_04F">

</codeblock>
<codeblock id="07_04F">
This is a hint.
</codeblock>


</exercise>


<exercise id="5" title="Multiple layers in `ggplot2`">
<slides source="chapter7_03_ggplot2layers">
</slides>
</exercise>


<exercise id="6" title="Practice creating multiple layers">

We are again going to use the `BudgetFood` data from the `Ecdat` package to make the plots.


Try to recreate the scatter plot below. Is there anything that unusual that you notice about the plot?

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in ggplot(data = BudgetFood, mapping = aes(x = totexp)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_06A">

</codeblock>
<codeblock id="07_06A">
XX.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in subset(BudgetFood, !is.na(sex)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_06B">

</codeblock>
<codeblock id="07_06B">
XX.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in subset(BudgetFood, size < 30): object 'BudgetFood' not found
```

</div>
<codeblock id="07_06C">

</codeblock>
<codeblock id="07_06C">
XX.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in subset(BudgetFood, !is.na(sex)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_06D">

</codeblock>
<codeblock id="07_06D">
XX.
</codeblock>

<div class='target'>

```
## Error in library(Ecdat): there is no package called 'Ecdat'
```

```
## Error in filter(., !is.na(sex)): object 'BudgetFood' not found
```

```
## Error in subset(dat, sex == "woman"): object 'dat' not found
```

</div>
<codeblock id="07_06E">

</codeblock>
<codeblock id="07_06E">
XX.
</codeblock>

</exercise>

<exercise id="7" title="Scales and guides in `ggplot2`">
<slides source="chapter7_04_ggplot2scales">
</slides>
</exercise>

<exercise id="8" title="Practice changing scales and guides.">


</exercise>

<exercise id="9" title="Multiple plots in one figure">
<slides source="chapter7_05_ggplot2facet">
</slides>
</exercise>

<exercise id="10" title="Practice combining multiple plots.">
<div class='target'>

```
## Error in ggplot(BudgetFood, aes(x = age)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_10A">

</codeblock>
<codeblock id="07_10A">
XX.
</codeblock>

<div class='target'>

```
## Error in subset(BudgetFood, !is.na(sex)): object 'BudgetFood' not found
```

</div>
<codeblock id="07_10B">

</codeblock>
<codeblock id="07_10B">
XX.
</codeblock>
<div class='target'>

```
## Error in ggplot(BudgetFood, aes(factor(size), wfood, color = sex)): object 'BudgetFood' not found
```

```
## Error in ggplot(BudgetFood, aes(factor(size), totexp, color = sex)): object 'BudgetFood' not found
```

```
## Error in eval(expr, envir, enclos): object 'g1' not found
```

</div>
<codeblock id="07_10C">

</codeblock>
<codeblock id="07_10C">
XX.
</codeblock>
</exercise>

<exercise id="11" title="Customise the look with themes in `ggplot2`">
<slides source="chapter7_06_ggplot2theme">
</slides>
</exercise>

<exercise id="12" title="Make publication ready plots.">

</exercise>
