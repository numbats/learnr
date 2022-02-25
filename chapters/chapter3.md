---
title: 'Chapter 3: How to ask for help'
description: With coding comes bugs and errors that need troubleshooting. In this
  chapter, you will learn how to decipher errors, find help for fixing them, and practice
  asking clear questions with minimally reproducible examples.
prev: /chapter2
next: /chapter4
type: chapter
id: 3

---
<exercise id="1" title="What are error messages?">

## Eek! There's a bug in my code and it's causing lots of <span style="color: red;">scary red errors</span>!

Don't panic - believe it or not, this error is just trying to help you!
It also may have just saved you from invalid results that you may not
have have noticed.

Errors can be frustrating, essentially you've just asked the computer to
do something and it has said no!

There are a few troubleshooting techniques that we can use to find the
source of the error, modify your code, and get the results you're
looking for.

## Read the error

The first step is to carefully **read** the error message, it often
contains clues into where and why the code didn't run. With some time
and experience, you'll begin to identify these errors and fix your code
quickly based on the message alone!

Here's an error you'll probably encounter in your own code someday.

``` {.r}
library(dplyr)
mtcars %>% 
  summarise(mean(mpg)))
```

    ## Error in eval(expr, envir, enclos): unexpected ')' in:
    ## "mtcars %>% 
    ##   summarise(mean(mpg)))"

Reading the error, R claims that it didn't expect `)` in our code ---
and we didn't expect an error! 😡

So, our clue is that something is wrong with our closing brackets, and
it also tells us that the problem is somewhere our code calculating the
average of `mpg` for the `mtcars` dataset.

To fix this we should closely inspect that section of the code for
something unusual with `)`. Counting the brackets, we can see there is a
mismatch in the number of brackets --- we opened 2 `(` brackets, but
closed 3 `)`. We need to remove a closing bracket... but which one?

For this example we can remove any of them, but this isn't always the
case. You should look carefully at your code, thinking about what
functions should be provided with which inputs. If you remove the wrong
bracket, you might be lucky enough to be met with a new error. 😅

## Search the message

~~Sometimes~~ Often error messages are confusing, and you after
carefully reading the message you still have no idea what it's trying to
tell you. Chances are you're not the first person to encounter this
problem, and there's a well explained solution waiting for you on the
internet. You just need to find it.

Take this [notoriously confusing
error](https://www.youtube.com/watch?v=vgYS-F8opgE) for example. In this
code, I wanted to see the first few values of my `sample` object.

``` {.r}
sample[1:3]
```

    ## Error in sample[1:3]: object of type 'closure' is not subsettable

What's a *'closure'*?! Why can't I subset my data with `x[1:3]`?

When confronted with an error you've never seen, and don't understand,
search the web. Just copy the error exactly,
`"object of type 'closure' is not subsettable"`, add some relevant
keywords like "R", and search!

With some luck, you'll be met with a series of StackOverflow threads,
blog posts and other websites explaining the solution to the exact
problem you're facing. Here's my top 3 search results:

-   <https://coolbutuseless.github.io/2019/02/12/object-of-type-closure-is-not-subsettable/>
-   <https://stackoverflow.com/questions/11308367/error-in-my-code-object-of-type-closure-is-not-subsettable>
-   <https://www.r-bloggers.com/2019/02/object-of-type-closure-is-not-subsettable/>

Some tips for searching errors with Google (and most other search
engines):

1.  Add double quotes around the error message. This searches for those
    exact words in that exact order.
2.  For long error messages, just search for the unique sounding parts
    (don't include parts specific to your code, like a variable name)
3.  Add keywords to describe your code's language, like 'R'.
4.  If you're looking for solutions on a specific website, add
    `site:<domain>` to the search. For example,
    `site:stackoverflow.com`.

## Divide and conquer

If you understand the message, but have no idea where the problem try
running smaller sections of your code to see if that small section
causes the error. Once you identify the small section of code causing
the error, it should be slightly easier to find the issue in your code.

If you're often encountering situations where you need to use this
strategy, it might be a sign of a code style issue. You might benefit
from writing your code in smaller pieces, rather than trying to do
everything in one line (or chain) of code. Some tips on good code style
can be found in [Jenny Bryan's presentation 'Code Smells and
Feels'](https://www.youtube.com/watch?v=7oyiPBjLAWY).

## Turn it off an on again

The classic, because sometimes it works. In R, you don't necessarily
need to restart your whole computer, but try restarting RStudio, or your
R session. Usually I would restart R, which can be done in RStudio using
the dropdown 'Session -\> Restart R', or the shortcut
Ctrl/Cmd+Shift+F10.

There are a few reasons this might work. It allows you to re-run your
code from a clean slate. No extra packages loaded that you haven't asked
for, no extra objects in your environment that might be hanging around.

</exercise>

<exercise id="2" title="Practice troubleshooting common errors">

Run the example below and interpret the error message. What does it tell
you?

When you run the code above, you show see error message:

> Error in cars %\>% mutate(total = dist \* speed): could not find
> function "%\>%"

This is generally the case when you did not load in the required
packages before trying to use this function. Try searching for this
error and see which packages you need to load in at the top of the code
to fix the error.

<codeblock id="03_01"> Hint: %\>% is an operater defined in magrittr
package which is used in tidyverse and dplyr. Try loading in one of
these packages before using %\>%.

</codeblock>

Often errors result from simple typos. Try running the code below and
carefully read the error message. Use the 'hint' button if you need some
help.

<codeblock id="03_02"> Hint: This error suggests that these is a problem
with the code in the mutate() function.\
Check that all variables used in computing total exist in the dataset.
Is there a typo in one of these variable names?

</codeblock>

Another common error is incorrectly matching the start and end brackets
of a `function()`. Earlier we saw what happens when you have an extra
closing bracket, but what happens when there is too many opening
brackets?

![text](missing.png)

Pay close attention to the symbols shown on the left of the console. The
start of a line of code is indicated by the `>`. However below this we
see a couple lines of `+`. The `+` indicates that R is waiting for more
code to be provided before running anything. In particular, it's waiting
for the `mean(` function to be provided with it's closing bracket `)`.

This can be tricky to debug, as suddenly R has stopped running any of
your code. Additionally, errors may show up suggesting that the problem
is far away from where it actually is. If you notice a `+` in your
console when you don't expect it, you can cancel out of the current
command by pressing the **Esc** key. This should clear the current code
from your console, allowing you to run more code and search for that
missing closing bracket.

</exercise>

<exercise id="3" title="Asking for help">

Once you've carefully read the error, searched the web, and tried
everything else you can think of, it's time to ask for help. However for
a stranger to take time out of their day to find the solution and write
a good answer for you, then you better have written a good question for
them.

A good question consists of a clear and concise description of your
problem, and a small example that can be used to reproduce the issue.

## Describe the problem

A good description provides some context to your question. What are you
doing and what are you trying to achieve?

-   Write more information than *'it doesn't work'* or *'it shows
    errors'*. These generic phrases don't describe the problem.
-   State what you want to achieve and the output you expected to get.\
-   Provide a copy of your error messages. This has to be exact words of
    your error messages.
-   Write a specific descriptive title that summarises your problem in a
    few words.

## Provide a minimal reproducible example

This step is so important that we've dedicated the entire next section
to writing good examples. An example allows the person helping you to
quickly understand the issue you are facing, and make changes directly
to your example to demonstrate the solution.

The process of creating an example, and reducing it down into the
minimal amount of code you can to produce the error, often results in
you finding the solution yourself.

## Where to ask for help

There are many websites commonly used by developers facing
troubleshooting errors, where experts visit and try to help.

[Stack Overflow](https://stackoverflow.com/questions/tagged/rstudio).
This is a platform where you can search for solutions and ask for help.
Before you put a question on [Stack
Overflow](https://stackoverflow.com/questions/tagged/rstudio), you can
search some key words from your understanding of your error messages. It
is likely that people already asked similar question related to your
error and you can try the solutions provided by others under the
question.

[RStudio Community](https://community.rstudio.com/#). This is a
community channel for RStudio users. Similar to [Stack
Overflow](https://stackoverflow.com/questions/tagged/rstudio), you can
ask questions and also find solutions.

[GitHub](https://github.com/). If you've investigated your error really
closely, and you believe that the problem exists in a package you're
using and not your code then you can ask the package's developer. Most R
packages are developed open source and maintained using GitHub, and you
can report issues with the package on their repository. You can find the
repository by searching for the name of the package with keywords 'R'
and 'GitHub', and then report an issue using the issues tab. You should
also do a quick search through the existing issues to see if someone has
already reported this problem.

Discussion forum on Moodle. If you're working through these materials as
preparation for your Monash University course, a good place to ask for
help is from your lecturer and tutors. A good place to ask is the
discussion forum on Moodle, and if you want practice in being a future
Stack Overflow hero try answering questions from other students in the
forum. Answering questions is a great way to consolidate your
understanding.

Ask your lectures and tutors in consultation sessions. Consultation
sessions are made available to students for any content related
difficulties, including debugging code. The same principals to asking a
good question apply here, take the time to prepare a small demonstration
of the error you're experiencing, and we can work with you to solve it.
The advantage of a consultation session is that we can direct you closer
toward the solution until you figure it out yourself! Don't be
disheartened if the error that you've been struggling with for many
hours is solved in minutes, we've had lots of practice (and been stuck
like you for many hours) troubleshooting these errors.

</exercise>

<exercise id="4" title="Minimal reproducible examples">

A minimally reproducible example (often called an MRE) contains all of
the code necessary for someone else to encounter the same error you're
facing. To create one, you need to provide the exact packages you're
using, some data if needed, and your code. A good example is also
minimal, which means that you've taken the time to remove as much
unrelated packages, code, and data as possible to produce the error.

## Providing minimal datasets

If your question involves using a dataset, you will need to provide a
small dataset to demonstrate the problem. Often people say that the data
is confidential and can't be provided, but usually the problem isn't
specific to the data you are using. Taking the time to try your code on
a different dataset is a good debugging step, and R provides many good
datasets to use in these examples built in. You can find a complete list
of datasets available to all R users with the
`data(package = "datasets")` function.

If you do need to use a custom dataset specific to your project, try
reducing the size of the dataset before making your example. The error
may only occur for some specific rows of your data. Once you've narrowed
in on the issue, you can convert your minimal data object to code for
producing it using the `dput()` function. For example, you can provide
the first 6 rows of the `iris` dataset with:

``` {.r}
dput(head(iris))
```

    ## structure(list(Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5, 5.4), 
    ##     Sepal.Width = c(3.5, 3, 3.2, 3.1, 3.6, 3.9), Petal.Length = c(1.4, 
    ##     1.4, 1.3, 1.5, 1.4, 1.7), Petal.Width = c(0.2, 0.2, 0.2, 
    ##     0.2, 0.2, 0.4), Species = structure(c(1L, 1L, 1L, 1L, 1L, 
    ##     1L), .Label = c("setosa", "versicolor", "virginica"), class = "factor")), row.names = c(NA, 
    ## 6L), class = "data.frame")

Copy this generated code, and make it part of your example to create
your example data.

Alternatively you can save this minimal dataset to a file, and attach
the file in your question.

When you read that file in, make sure you avoid absolute paths to it.
Not everyone has the same file structure as you, so they won't be able
to access your dataset if it is stored at
`/home/learnr/Documents/My Job/project_2040/data/example.csv`. Instead
provide a short relative path, such as `example.csv`, or
`data/example.csv`. If you're uploading files, it's also nice to provide
a zip that contains an R script of your minimal reproducible code, along
with the data in the folders referenced by the script.

## Provide minimal code

As part of a data analysis you probably write a lot of code. You need to
read in the data, tidy it up, run some calculations and make some plots.
When you run into an error, providing your entire analysis just makes it
more time consuming for helpers to run your code and identify the source
of the error.

A *minimal* reproducible example cuts out as much of the code as
possible, keeping just a few essential lines for producing the error. If
your error comes after the data cleaning, remove that code and start
with a clean, minimal dataset.

If your code includes any randomisation, it's a good idea to set the
random seed using the `set.seed()` function. This ensures that each time
the code is ran, the same random results are obtained.

The process of cleaning up your code and reducing it down into a small
example is another great exercise that often helps you identify the
problem and fix it yourself.

Remember, you need to provide all code necessary to load in packages you
use, read in data, and run functions that cause the error.

## Provide session information using `sessioninfo::session_info()`

Sometimes the problem is specific to the versions of packages you're
using, or the operating system you have. Providing a comprehensive list
of the software you're using helps identify these issues.

The `sessioninfo::session_info()` function provides a nicely formatted
summary of your computing environment, which makes it easier to fix some
version, language, or OS specific problems. A good minimal reproducible
example should come with a copy of this session information output.

## Using the `reprex` package for producing examples

The `reprex` package is a useful tool that help you make a reproducible
example. It can be used to run the code in your example in a clean
environment, which is a good way to test if you've included everything
necessary for others to reproduce the error. It'll also copy a neatly
formatted version of your example, which includes images and console
output from the example as it runs on your computer. It can even include
a collapsible summary of your session information.

Once you've prepared the minimal code for your reproducible example,
copy it all and then run `reprex::reprex()` in your console.
Alternatively, if you're using RStudio you can use the "Render
reprex..." option from the "Addins" dropdown.

![reprex RStudio addin](addin.png)

Once you clicked on `Render reprex...`, it will show you a pop-up
window:

![reprex addin options pop-up](reprex_render.png)

As you've copied the example entirely, you can use the 'on the
clipboard' source. Choose a venue for where you're planning to post the
question, and tick 'Append session info'. Finally, press **Render** to
run your code and see if it is reproducible.

From your **Viewer** window, it will show the what the reproducible
example looks like. This output is automatically copied to your
clipboard in a format suitable for pasting directly into the website you
specified earlier.

</exercise>

<exercise id="5" title="Asking for help checklist">

This is not an exhaustive check-list. What needs to be included and
checked is very question specific, but this checklist should apply to
most questions.

-   <input type="checkbox" unchecked> Is the problem clearly and
    succinctly described? </input>

-   <input type="checkbox" unchecked> Is the expected solution or
    behaviour outlined? </input>

-   <input type="checkbox" unchecked> Has nobody else asked this
    question before? </input>

-   <input type="checkbox" unchecked> Are you asking the right people at
    the right place? </input>

-   <input type="checkbox" unchecked> Have you added appropriate tags or
    keywords to reach the right experts? </input>

-   <input type="checkbox" unchecked> Have you prepared your example
    using the reprex package to ensure the problem is easily reproduced
    on other computers?</input>

-   <input type="checkbox" unchecked> Have you minimised your problem as
    much as possible, removing irrelevant packages, data and code?
    </input>

### If your questions involves a dataset

-   <input type="checkbox" unchecked> Is the data supplied? </input>

-   <input type="checkbox" unchecked> If the data is big, could you cull
    your data further to communicate or reproduce the problem? </input>

</exercise>

<exercise id="6" title="Additional Resources ">

-   [An excellent presentation about debugging
    errors](https://www.youtube.com/watch?v=vgYS-F8opgE)

-   [How to create a Minimal, Reproducible Example -
    StackOverflow](https://stackoverflow.com/help/minimal-reproducible-example)

-   [Posting Guide: How to ask good questions that prompt useful
    answers](https://www.r-project.org/posting-guide.html)

-   [How to make a great R reproducible
    example](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example)

-   [Get Help! How to use reprex
    package.](https://www.tidyverse.org/help/)

-   [Three tips for posting good questions to R-help and Stack
    Overflow](https://www.r-bloggers.com/2011/01/three-tips-for-posting-good-questions-to-r-help-and-stack-overflow/)

</exercise>
