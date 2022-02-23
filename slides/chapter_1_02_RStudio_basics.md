---
title: RStudio basics
type: slides

---
### What does RStudo looks like?

<img src="images/chapter1-02/RStudio_interface_1.png" width="80%" style="display: block; margin: auto;" />

Note: Once you open RStudio, you should see this interface.

On the left-hand side, you have `Console` which is the place where
commands written in the R language can be typed and executed immediately
by the computer.

On the right-hand side, you have two windows. The one on the top is your
`Global Environment` where it shows the variables and datasets in the
environment.

The window on the bottom right has a few different sessions including
`Files`, `Plots`, `Packages`, `Help` and `Viewer`.

---

### Adding a new R Script

<img src="images/chapter1-02/RStudio_Add_script.png" width="80%" style="display: block; margin: auto;" />

Note: You can run r code in the `Console` but once you close RStudio,
you loss your code in `Console`.

To make your work reproducible, you can write and store all your code in
a `R Script`.

---

### R Script

<img src="images/chapter1-02/RStudio_rscript_1.png" width="80%" style="display: block; margin: auto;" />

Note: In an `R Script` you can write code and add comments. You can run
each line by pressing `ctrl + enter/return`.

After you run each line of the code, you can see the messages in your
`Console`.

---

### R packages installation and loading

-   <font size="6"> The previous example showed how to load in the
    packages using `library()`. However, before you can use `library()`
    to load the package you need to first have it **installed**. </font>

-   <font size="6"> Think about the package installation process as
    purchasing a book (package) and store it on a bookshelf (in the
    library folder). </font>

---

### R packages installation and loading

-   <font size="6"> Loading the package using `library()` is like bring
    out the book (package) to your current working environment. </font>

-   <font size="6"> Therefore, before you could load in packages you
    need to make sure that you have that package installed.</font>

---

### R packages installation and loading

<img src="images/chapter1-02/RStudio_package.png" width="80%" style="display: block; margin: auto;" />

Note: To check what packages you already have, go to the `Packages`
window on the bottom right.

If you are not sure whether you have the packages or not, you could also
type in the package name in the search bar to see if you have already
downloaded that package or not.

---

### R packages installation and loading

There are two ways to install packages.

<img src="images/chapter1-02/RStudio_Install_pkg.png" width="80%" style="display: block; margin: auto;" />

Note: The first way is by clicking. Open the `Pacakges` window on the
bottom right, click on `Install`
<svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
<path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-143.6-28.9L288 302.6V120c0-13.3-10.7-24-24-24h-16c-13.3 0-24 10.7-24 24v182.6l-72.4-75.5c-9.3-9.7-24.8-9.9-34.3-.4l-10.9 11c-9.4 9.4-9.4 24.6 0 33.9L239 404.3c9.4 9.4 24.6 9.4 33.9 0l132.7-132.7c9.4-9.4 9.4-24.6 0-33.9l-10.9-11c-9.5-9.5-25-9.3-34.3.4z"></path></svg>.

You should see the pop-up below. You can type in the packages you want
to install in and make sure that all the dependencies are also
downloaded.

Click `Install`, then you should have the package install in your local
computer.

Alternately, you can run `install.pakcages("")` with the package name
inside `""`.

---

### Customised your RStudio - Changing Global Options

<img src="images/chapter1-02/RStudio_tools.png" width="80%" style="display: block; margin: auto;" />

Note: Customise your RStudio, go `Tools`
<svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
<path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg>
`Global Options..`

---

### Customised your RStudio - Changing Global Options

<img src="images/chapter1-02/RStudio_mirror.png" width="50%" style="display: block; margin: auto;" />

-   If you are not able to download package from this sources, go to
    `Global Options...`
    <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
    <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg>
    `Packages`
    <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
    <path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg>
    `Primary CRAN repositor`. You can select the mirror that is
    physically close to you which might be easier for you to connect to.

Note: If you are having difficulty downloading packages in your country,
you could change where you download your packages. The default
downloading mirror is `Global-RStudio` which is downloading packages
from the CRAN RStudio Cloud.

---

### Customised your RStudio - Changing Global Options

<img src="images/chapter1-02/RStudio_apprenve.png" width="80%" style="display: block; margin: auto;" />

Note: You can also change the appearance of your RStudio from the
`Global Options...`
<svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">
<path d="M256 8c137 0 248 111 248 248S393 504 256 504 8 393 8 256 119 8 256 8zm-28.9 143.6l75.5 72.4H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h182.6l-75.5 72.4c-9.7 9.3-9.9 24.8-.4 34.3l11 10.9c9.4 9.4 24.6 9.4 33.9 0L404.3 273c9.4-9.4 9.4-24.6 0-33.9L271.6 106.3c-9.4-9.4-24.6-9.4-33.9 0l-11 10.9c-9.5 9.6-9.3 25.1.4 34.4z"></path></svg>
`Appearance`.
