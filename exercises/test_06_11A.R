  
  
plot <- last_plot()
answer_mapping <- aes(x = age)
expect_equal(plot$mapping, answer_mapping, info = "The plot's mapping variables are incorrect.")
facet_type <- inherits(plot$facet, "FacetWrap")
expect_true(facet_type, info = "The facet type is incorrect.")
facet_vars <- identical(names(plot$facet$params$facets), "town")
expect_true(facet_type, info = "The variable facetting the plot is incorrect.")
