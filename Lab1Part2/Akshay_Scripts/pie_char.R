rm(list =ls())
library(ggplot2)

setwd("/Users/akshaychopra/Documents/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Akshay_Scripts")

data<- read.csv("../Data/Influenza sub type pie charts/Genetic04.csv")


#table(data$X.Sub.type)
#plot(data$Number~data$Genetic_Group, ylab="Number", xlab="Genetic Group", main= "Number vs Genetic Group")
#ggplot(data, aes(y=data$Number, x= data$X.Sub.type , shape=data$Genetic_Group))+geom_point()

head(data)

mydata<- data[9:11,]
mydata<- mydata[-c(1)]