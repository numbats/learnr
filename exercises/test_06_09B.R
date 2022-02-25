
plot <- last_plot()
log10_scale <- vapply(plot$scales$scales, function(x) "x" %in% x$aesthetics, logical(1L))
discrete_scale <- vapply(plot$scales$scales, function(x) any(c("color", "colour") %in% x$aesthetics), logical(1L))
brewer_scale <- vapply(plot$scales$scales, function(x) "fill" %in% x$aesthetics, logical(1L))
log10_answer <- which(log10_scale) == 1L
discrete_answer <- which(discrete_scale) == 2L
brewer_answer <- which(brewer_scale) == 3L
expect_true(log10_answer, info = "The answer for the *_log10() scale is incorrect.")
expect_true(discrete_answer, info = "The answer for the *_discrete() scale is incorrect.")
expect_true(brewer_answer, info = "The answer for the *_brewer() scale is incorrect.")
