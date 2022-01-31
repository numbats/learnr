library(testthat)
  
test <- function() {
    if ((class(roll_a_die()) != "integer")|(roll_a_die()> 6)|(roll_a_die()<1)) {
      stop("Is your function returning integers from 1 to 6 ? Check the body of the function.")
    }
    success("Well done!")
}

test()

