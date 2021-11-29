test <- function() {
    # Here we can either check objects created in the solution code, or the
    # string value of the solution, available as .solution. See the testTemplate
    # in the meta.json for details.
    if (n != nrow(mtcars)) {
        stop("Are you getting the correct length?")
    }
    if (!grepl("mtcars$gear", .solution, fixed = TRUE)) {
        stop("Are you printing the correct variable?")
    }

    # This function is defined in the testTemplate
    success("Well done!")
}
