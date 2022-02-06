---
title: 'Chapter 4: Project Structure'
description: This chapter will teach you the basic project structure and good practice
  of project management in R.
prev: /chapter3
next: /chapter5
type: chapter
id: 5

---
<exercise id="1" title="Getting start with an R project" type="slides">

<slides source="chapte4_01_Project_Structure"> </slides>

</exercise>

<exercise id="2" title="Files Structure and Naming">

## Files Structure

-   There are many ways you can organise your files. The one principle
    you should follow is that make sure all the files you used in your
    analysis are all in one working directory.

-   Having all the files in one working directory allows you to use
    relative path to direct the file locations and it is reproducible by
    others.

-   Generally you will have an data folder, a scripts folder and a
    folder for results.

-   `/data` folder will contain all the data you are working with for
    this project. You could also have more folders inside your `/data`
    folder. For example, if the data you are working with need
    pre-processing and cleaning, you could have a `/data/raw` and
    `/data/propcessed` folder under `/data`. This way you can read in
    the processed data to your analysis script.

-   `/scripts` folder will contain all your scripts for analysis. You
    may separate your code into different scripts as you like.

-   `/results` folder will contain your analysis results.

-   You could also have other folders to store all the relevent
    docutments as you like.

## Naming

-   In R, `.` represents the wild card. When naming your variables, you
    should avoid using `.` as part of variable names. Instead, you could
    use `_`. i.e. `x_1`, `x_2`.

</exercise>

<exercise id="3" title="Additional Sources">

-   [R for Data Science - chapter 8](https://r4ds.had.co.nz)

-   [Project-oriented
    workflow](https://rstats.wtf/project-oriented-workflow.html)

-   [here package](https://here.r-lib.org)

</exercise>
