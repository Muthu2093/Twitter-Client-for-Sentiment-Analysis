rm(list =ls())
library(ggplot2)
library(gridExtra)
library(ggpubr)

setwd("/Users/akshaychopra/Documents/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Akshay_Scripts")

data<- read.csv("../Data/Influenza sub type pie charts/Genetic04.csv")


#table(data$X.Sub.type)
#plot(data$Number~data$Genetic_Group, ylab="Number", xlab="Genetic Group", main= "Number vs Genetic Group")
#ggplot(data, aes(y=data$Number, x= data$X.Sub.type , shape=data$Genetic_Group))+geom_point()

head(data)



mydata_1<- data[9:11,]
mydata_1<- mydata_1[-c(1 )]

bp_1<- ggplot(mydata_1, aes(x="", y=Number,))+
  geom_bar(width = 1, stat = "identity")

pie_1 <- bp_1 + coord_polar("y", start=0) 

mydata_2<- data[6,]
mydata_2<- mydata_2[-c(1)]

bp_2<- ggplot(mydata_2, aes(x="", y=Number,))+
  geom_bar(width=1, stat ="identity")
  
pie_2 <- bp_2 + coord_polar("y", start=0)
pie_2

mydata_3<- data[1:2,]
mydata_3<- mydata_3[-c(1 )]

bp_3<- ggplot(mydata_3, aes(x="", y=Number,))+
  geom_bar(width = 1, stat = "identity")


pie_3 <- bp_3 + coord_polar("y", start=0) 
pie_3

mydata_4<- data[3,]
mydata_4<- mydata_4[-c(1 )]

bp_4<- ggplot(mydata_4, aes(x="", y=Number, ))+
  geom_bar(width = 1, stat = "identity")


pie_4 <- bp_4 + coord_polar("y", start=0) 
pie_4 


##############################################

ggarrange(pie_1,pie_2,pie_3,pie_4, labels=c("A","B","C"), ncol=2, nrow=2)


#ggplot(mydata, aes(y=Genetic_Group, x= Number)) +geom_point()
