ggplot(BudgetFood, aes(x = age)) + 
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1) +
  geom_density(colour = "red") +
  facet_wrap(~town, labeller = label_both) +
  labs(x = "Age", y = "Density", title = "Age distribution by town size") +
  theme(text = ___(size = 14, family = "mono"),
        plot.background = ___(fill = "grey80"),
        ___ = element_rect(fill = "black"),
        ___ = element_text(color = "white"),
        panel.background = ___(fill = "white",
                                        color = "black"),
        panel.grid = element_blank())

