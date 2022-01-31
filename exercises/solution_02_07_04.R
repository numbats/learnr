
symbol <- c('N','O','H','He','B','C','F','Ne','Li','Be')
element <- c('Nitrogen','Oxygen','Hydrogen','Helium','Boron','Carbon','Fluorine','Neon','Lithium','Beryllium')
chemical_group <- c('Nonmetal','Nonmetal','Nonmetal','Noble Gas','Metalloid','Nonmetal','Halogen','Noble Gas','Alkali Metal','Alkaline Earth Metal')
atomic_no <- c(7,8,1,2,5,6,9,10,3,4)

first_ten_elements <- data.frame(symbol, element, chemical_group, atomic_no)

# Use order() to create positions
positions <- order(first_ten_elements$atomic_no)

# Use positions to create a sort the first_ten_elements
sorted_df <- first_ten_elements[positions, ]

___


Hint: 
- Use order(first_ten_elements$atomic_no) to create positions.
- Then, use 'positions' with square brackets: first_ten_elements[...]; can you fill in the ...? Don not forget that 'positions' indicates the order of the rows in the data frame.
