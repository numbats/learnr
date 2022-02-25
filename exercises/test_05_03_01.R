
expect_true("petal_area" %in% names(new_iris), info = "The petal_area column is missing from your dataset")
expect_equal(nrow(new_iris), 117, info = "The resulting dataset should have 117 rows, something isn't right with your filter() arguments.")
