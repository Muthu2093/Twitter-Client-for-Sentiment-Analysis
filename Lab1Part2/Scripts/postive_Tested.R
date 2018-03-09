library(reshape2)
library(ggplot2)

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

label=c("2017W40","2017W41","2017W42","2017W43","2017W44","2017W45","2017W46","2017W47","2017W48","2017W49","2017W50","2017W51","2017W52","2018W01","2018W02","2018W03","2018W04")
colnames(data)= label
data <- melt(data)



label=c("Type.of.disease", "Week", "Total")
colnames(data) <- label
ggplot(data, aes(x=Week, y=Total, fill=Type.of.disease)) + 
  geom_bar(stat="identity") +
  xlab("\n Weeks(2017: 41-52, 2018:01-04)") +
  ylab("Total number of postive cases\n") +
  theme_bw()

