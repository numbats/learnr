
expect_true(inherits(roll_a_die(), "integer"), info = "Your function should return an integer")
rolls <- vapply(seq_len(1000), function(x) roll_a_die(), integer(1L))
expect_true(min(rolls) >= 1L, info = "Your function returns dice numbers less than 1.")
expect_true(max(rolls) <= 6L, info = "Your function returns dice numbers more than 6.")

