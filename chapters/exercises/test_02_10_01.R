library(testthat)
  
test <- function() {
  if (my_result[5] != 0.00198){
    stop("Try again.")
  }
  success("Well done!")
}


