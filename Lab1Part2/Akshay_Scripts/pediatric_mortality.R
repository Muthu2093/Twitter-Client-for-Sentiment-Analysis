rm(list =ls())
library(ggplot2)

setwd("/Users/akshaychopra/Documents/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Akshay_Scripts")

Weekly_data<- read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/PedFluDeath_WeeklyData.csv")

SeasonDeath_data<-read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/Season_Deaths.csv")

p<-ggplot(Weekly_data,aes(x=WEEK.NUMBER, y=PREVIOUS.WEEKS.DEATHS)) +
  ggtitle("Number of influenza associated Pediatric Deaths
           by Week of Death")+
  labs(x="Week of Death", y="Number of deaths", fill=NULL)
 
  b<- p+ geom_bar(stat="identity", fill = "green", position="stack")
  b<-b+scale_fill_brewer(palette = "Set1")
  
  
  b<- b+ theme(axis.text.x=element_text(angle=60))
  
  b
  