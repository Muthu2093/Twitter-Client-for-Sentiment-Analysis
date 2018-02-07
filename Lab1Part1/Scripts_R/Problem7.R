#Repeat the data with some other rich data set from Rpackage

splom(mtcars[c(1,3,4,5,6)], main="MTCARS Data")
splom(mtcars[c(1,3,4,6)], main="MTCARS Data")
splom(mtcars[c(1,3,4,6)], col=rainbow(),main="MTCARS Data")
Another data set: “rock”
splom(rock[c(1,2,3,4)], main="ROCK Data")