library(testthat)

test <- function() {
    if (x != 25) {
        stop("Are you using the correct numbers and symbols? Have you try the hint?")
    }
    if (y != 75) {
      stop("Are you using the correct numbers and symbols? Have you try the hint?")
    }
    # This function is defined in the testTemplate
    success("Well done!")
}
test()
