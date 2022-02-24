library(testthat)
  
test <- function() {
  if (abs(my_result[5] - 0.00198) >= 1e-4){
    stop("Try again.")
  }
  success("Well done!")
}


