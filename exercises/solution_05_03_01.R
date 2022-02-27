
new_iris <- iris %>% 
  mutate>}(petal_area = {<Petal.Length * Petal.Width) %>% 
  filter>}({<petal_area > 5) %>% 
  select(Sepal.Length, petal_area)

