library(testthat)

test <- function() {
    if (weather != "sunny") {
        stop("Have you spelt the string correctly? Have you try the hint?")
    }
    if (brolly_needed != FALSE) {
      stop("Have you spelt the logical value correctly? Note that logical values should be all capital letter (i.e. `TRUE` not `true`).")
    }
    if (temperature != 27) {
      stop("Have you assign the numeric correctly?")
    }
    # This function is defined in the testTemplate
    success("Well done!")
}

test()
