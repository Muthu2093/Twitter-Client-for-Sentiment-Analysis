rm(list =ls())


setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Scripts")

data <- read.csv("../Data/Postive Tested/Workbook1.csv")
head(data)
tail(data)
data <- subset( data, select = -Total...Tested )
data <- data[-c(18, 19, 20, 21, 22), ]
data <- t(data)
colnames(data) <- data[1, ] 
data <- data[-1, ]

label=c("W41","W41","W42","W43","W44","W45","W46","W47","W48","W49","W50","W51","W52","W01","W02","W03","W04")
colnames(data)= label
data <- melt(data)

library(ggplot2)

label=c("Type.of.disease", "Week", "Total")
colnames(data) <- label
ggplot(data, aes(x=Week, y=Total, fill=Type.of.disease)) + 
  geom_bar(stat="identity") +
  xlab("\n Weeks(2017: 41-52, 2018:01-04)") +
  ylab("Total number of postive cases\n") +
  theme_bw()

