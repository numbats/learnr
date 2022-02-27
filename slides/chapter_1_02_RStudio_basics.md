---
title: RStudio basics
type: slides

---
### What does RStudio looks like?

<img src="chapter1/chapter1-02/RStudio_interface_1.png" style="display: block; margin: auto;" />

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

<img src="chapter1/chapter1-02/RStudio_Add_script.png" style="display: block; margin: auto;" />

Note: You can run r code in the `Console` but once you close RStudio,
you loss your code in `Console`.

To make your work reproducible, you can write and store all your code in
a `R Script`.

---

### R Script

<img src="chapter1/chapter1-02/RStudio_rscript_1.png" style="display: block; margin: auto;" />

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

<img src="chapter1/chapter1-02/RStudio_package.png" style="display: block; margin: auto;" />

Note: To check what packages you already have, go to the `Packages`
window on the bottom right.

If you are not sure whether you have the packages or not, you could also
type in the package name in the search bar to see if you have already
downloaded that package or not.

---

### R packages installation and loading

There are two ways to install packages.

<img src="chapter1/chapter1-02/RStudio_Install_pkg.png" style="display: block; margin: auto;" />

Note: The first way is by clicking. Open the `Pacakges` window on the
bottom right, click on `Install`
![](/tmp/RtmpaUlBQk/file5d7cf6b356d84.png){height="0.7em"}.

You should see the pop-up below. You can type in the packages you want
to install in and make sure that all the dependencies are also
downloaded.

Click `Install`, then you should have the package install in your local
computer.

Alternately, you can run `install.pakcages("")` with the package name
inside `""`.

---

### Customised your RStudio - Changing Global Options

<img src="chapter1/chapter1-02/RStudio_tools.png" style="display: block; margin: auto;" />

Note: Customise your RStudio, go `Tools`
![](/tmp/RtmpaUlBQk/file5d7cf6bdc9a1.png){height="0.7em"}
`Global Options..`

---

### Customised your RStudio - Changing Global Options

<img src="chapter1/chapter1-02/RStudio_mirror.png" width="50%" style="display: block; margin: auto;" />

-   If you are not able to download package from this sources, go to
    `Global Options...`
    ![](/tmp/RtmpaUlBQk/file5d7cf849c20a.png){height="0.7em"} `Packages`
    ![](/tmp/RtmpaUlBQk/file5d7cf7a0e9f38.png){height="0.7em"}
    `Primary CRAN repositor`. You can select the mirror that is
    physically close to you which might be easier for you to connect to.

Note: If you are having difficulty downloading packages in your country,
you could change where you download your packages. The default
downloading mirror is `Global-RStudio` which is downloading packages
from the CRAN RStudio Cloud.

---

### Customised your RStudio - Changing Global Options

<img src="chapter1/chapter1-02/RStudio_apprenve.png" style="display: block; margin: auto;" />

Note: You can also change the appearance of your RStudio from the
`Global Options...`
![](/tmp/RtmpaUlBQk/file5d7cfa31b5e6.png){height="0.7em"} `Appearance`.
