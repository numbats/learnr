library(testthat)

test <- function() {
    S = matrix(c(1,0,0,1), byrow=TRUE, nrow=2)
    T = matrix(c(2,2,4,3), byrow=TRUE, nrow=2)
    if (M != rbind(S,T)) {
        stop("This is incorrect. Are you using the function that we have introduced? Try the Hint!")
    }
    if (part_of_M != M[1:3,2]) {
      stop("Have you got the indexing right? Try the Hint!")
    }
    # This function is defined in the testTemplate
    success("Well done! You have mastered the basics of operating on matrices using R.")
}
test()

