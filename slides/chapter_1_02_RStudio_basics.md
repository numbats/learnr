---
title: "RStudio basics"
output:
  revealjs::revealjs_presentation:
     css: [reveal.css, slide.css]
     transition: slide
     keep_md: true
     lib_dir: libs/
     self_contained: false
---



## What does RStudo looks like? 

Once you open RStudio, you should see this interface. On the left-hand side, you have `Console` which is the place where commands written in the R language can be typed and executed immediately by the computer.::: [Introduction to R](https://cengel.github.io/R-intro/backgroud.html#what-is-r-what-is-rstudio)::: On the right-hand side, you have two windows. The one on the top is your `Global Environment` where it shows the variables and datasets in the environment. The window on the bottom right has a few different sessions including `Files`, `Plots`, `Packages`, `Help` and `Viewer`. 

<img src="images/chapter1-02/RStudio_interface_1.png" width="50%" />

---

## Adding a new R Script 

You can run r code in the `Console` but once you close RStudio, you loss your code in `Console`. To make your work reproducible, you can write and store all your code in a `R Script`. 

<img src="images/chapter1-02/RStudio_Add_script.png" width="50%" />

---

## R Script 

In an `R Script` you can write code and add comments. You can run each line by pressing `ctrl + enter/return`. After you run each line of the code, you can see the messages in your `Console`. 

<img src="images/chapter1-02/RStudio_rscript_1.png" width="50%" />

---

## R packages installation and loading 

* The previous example showed how to load in the packages using `library()`. However, before you can use `library()` to load the package you need to first have it **installed**.   

* Think about the package installation process as purchasing a book (package) <svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M448 360V24c0-13.3-10.7-24-24-24H96C43 0 0 43 0 96v320c0 53 43 96 96 96h328c13.3 0 24-10.7 24-24v-16c0-7.5-3.5-14.3-8.9-18.7-4.2-15.4-4.2-59.3 0-74.7 5.4-4.3 8.9-11.1 8.9-18.6zM128 134c0-3.3 2.7-6 6-6h212c3.3 0 6 2.7 6 6v20c0 3.3-2.7 6-6 6H134c-3.3 0-6-2.7-6-6v-20zm0 64c0-3.3 2.7-6 6-6h212c3.3 0 6 2.7 6 6v20c0 3.3-2.7 6-6 6H134c-3.3 0-6-2.7-6-6v-20zm253.4 250H96c-17.7 0-32-14.3-32-32 0-17.6 14.4-32 32-32h285.4c-1.9 17.1-1.9 46.9 0 64z"></path></svg> and store it on a bookshelf (in the library folder) <svg viewBox="0 0 640 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M504 352H136.4c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0 96H136.1c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8h368c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0-192H136.6c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm106.5-139L338.4 3.7a48.15 48.15 0 0 0-36.9 0L29.5 117C11.7 124.5 0 141.9 0 161.3V504c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V256c0-17.6 14.6-32 32.6-32h382.8c18 0 32.6 14.4 32.6 32v248c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V161.3c0-19.4-11.7-36.8-29.5-44.3z"></path></svg>.

* Loading the package using `library()` is like bring out the book (package) to your current working environment. 

* Therefore, before you could load in packages you need to make sure that you have that package installed.   
  
---

## R packages installation and loading 

To check what packages you already have, go to the `Packages` window on the bottom right. If you are not sure whether you have the packages or not, you could also type in the package name in the search bar to see if you have already downloaded that package or not. 

<img src="images/chapter1-02/RStudio_package.png" width="50%" />


---

## R packages installation and loading 

There are two ways to install packages. 

* The first way is by clicking. Open the `Pacakges` window on the bottom right, click on `Install` <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-143.6-28.9L288 302.6V120c0-13.3-10.7-24-24-24h-16c-13.3 0-24 10.7-24 24v182.6l-72.4-75.5c-9.3-9.7-24.8-9.9-34.3-.4l-10.9 11c-9.4 9.4-9.4 24.6 0 33.9L239 404.3c9.4 9.4 24.6 9.4 33.9 0l132.7-132.7c9.4-9.4 9.4-24.6 0-33.9l-10.9-11c-9.5-9.5-25-9.3-34.3.4z"></path></svg>. You should see the pop-up below. You can type in the packages you want to install in and make sure that all the dependencies are also downloaded. Click `Install`, then you should have the package install in your local computer. 

<img src="images/chapter1-02/RStudio_Install_pkg.png" width="50%" />
  
     
* Alternately, you can run `install.pakcages("")` with the package name inside `""`.


---

## Customised your RStudio - Changing Global Options 

* Customise your RStudio, go `Tools` <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg> `Global Options..`

<img src="images/chapter1-02/RStudio_tools.png" width="50%" />


---

## Customised your RStudio - Changing Global Options 

* If you are having difficulty downloading packages in your country, you could change where you download your packages. The default downloading mirror is `Global-RStudio` which is downloading packages from the CRAN RStudio Cloud.

* If you are not able to download package from this sources, go to `Global Options...` <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg> `Packages` <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg> `Primary CRAN repositor`. You can select the mirror that is physically close to you which might be easier for you to connect to. 


<img src="images/chapter1-02/RStudio_mirror.png" width="50%" />

---

## Customised your RStudio - Changing Global Options 

* You can also change the appearance of your RStudio from the `Global Options...` <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg> `Appearance`. 

<img src="images/chapter1-02/RStudio_apprenve.png" width="50%" />
