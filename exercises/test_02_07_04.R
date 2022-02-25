  
symbol <- c('N','O','H','He','B','C','F','Ne','Li','Be')
element <- c('Nitrogen','Oxygen','Hydrogen','Helium','Boron','Carbon','Fluorine','Neon','Lithium','Beryllium')
chemical_group <- c('Nonmetal','Nonmetal','Nonmetal','Noble Gas','Metalloid','Nonmetal','Halogen','Noble Gas','Alkali Metal','Alkaline Earth Metal')
atomic_no <- c(7,8,1,2,5,6,9,10,3,4)
first_ten_elements <- data.frame(symbol, element, chemical_group, atomic_no)
solution <- first_ten_elements[order(first_ten_elements$atomic_no), ]
expect_equal(sorted_df, solution, info = "Did you follow the order of columns as stated in the instruction?")

