#Problem 7
#Scatter plots 


library(lattice)
splom(mtcars[c(1,3,4,5,6)], main="MTCARS Data")
splom(mtcars[c(1,3,4,6)], main="MTCARS Data")
splom(mtcars[c(1,3,4,6)], col=rainbow(),main="MTCARS Data")

splom(rock[c(1,2,3,4)], main="ROCK Data")





