S <- matrix(c(1,0,0,1), byrow=TRUE, nrow=2)
T <- matrix(c(2,2,4,3), byrow=TRUE, nrow=2)
# Construct a matrix M by stacking S on top of T
M <- rbind(S,T)

# Select a sub-matrix of M with the data on the rows 1, 2, 3 and columns 2.
part_of_M <- M[1:3,2]

