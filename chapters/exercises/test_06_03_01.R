library(testthat)

test <- function() {
    if (nrow(new_iris) != 117) {
        stop("Are you filtering the petal area correctly?")
    }
    success("Well done!")
}

test()

