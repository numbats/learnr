
S_mat <- matrix(c(1,0,0,1), byrow=TRUE, nrow=2)
T_mat <- matrix(c(2,2,4,3), byrow=TRUE, nrow=2)
M_sol <- rbind(S_mat,T_mat)
expect_equal(
  M_mat,
  M_sol,
  info = "The `M` object does not contain the matrix we expected. Are you using the function that we have introduced? Try the Hint!"
)
part_of_M_sol <- M_sol[1:3,2]
expect_equal(
  part_of_M,
  part_of_M_sol,
  info = "Have you got the indexing right? Try the Hint!"
)

