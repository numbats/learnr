library(testthat)

test <- function() {
    if (power_three(20) != 20^3){
      stop("Did you correctly define the function power_three()? Check the function body. Are you taking the input argument to the power three?")
    }
    success("Well done!")
}


