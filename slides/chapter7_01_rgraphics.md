---
title: R Graphics
execute:
  keep-md: true
format: 
  revealjs:
    logo: images/monash-stacked-blue-rgb-transparent.png
    slide-number: true
    show-slide-number: all
    # below doesn't seem to be working
    #width: wide
type: slides
---





## Why data visualisation?

<blockquote>
A picture is worth a thousand words
</blockquote>

* Data visualisation is a powerful tool to **_explore_**, **_understand_** and **_communicate_** data

---

## Graphics

* Graphics are commonly stored in a standard image format such as svg, jpg, png, pdf, and so on. 
* When you view these graphics electronically, you would be using some graphical device to render the stored image 
* R would render these using either `windows`, `X11` or `quartz` graphical devices (depending on the your operating system)
* This rendering is carried out by R's graphics engine, `grDevices`, which is one of the core package within the R system

---

## R Graphics

![](images/r-graphics-system.png)

---

## Graphics model in R 

* There are two main graphics model in R through two core packages: 
    * `graphics` package, and
    * `grid` package.
* The `graphics` package is loaded when you launch R so there is no need to load this.
* Plot using the `graphics` system is normally refered to as the **base graphics**.
* If the graphics is produced using the `grid` package, then it is using the **`grid` graphics** model.

---

## Base graphics

* Think of this as a painting on an empty canvas
* The `plot()` functions usually produces base graphics

---

## `grid` graphics

* The `grid` package contains low-level graphics system.
* This system gives a lot of control over the graphics, but requires the user to do a lot of work.
* You won't be directly interacting with the `grid` package most of the time.
* Instead you'll be using the `ggplot2` package that provides high-level functions for plotting via the `grid` system