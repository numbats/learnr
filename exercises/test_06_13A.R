  
plot <- last_plot()
theme_answer <- theme(text = element_text(size = 14, family = "mono"),
        plot.background = element_rect(fill = "grey80"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(color = "white"),
        panel.background = element_rect(fill = "white",
                                        color = "black"),
        panel.grid = element_blank())

expect_equivalent(plot$theme, theme_answer, info = "The theme specified does not exactly match the plot shown above. Check that you are targeting the correct element for each customisation.")
