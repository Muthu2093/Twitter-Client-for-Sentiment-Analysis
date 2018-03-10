## Script file to plot Influenza-Associated Pediatric Deaths
rm(list =ls())
library(ggplot2)

## Load data from CSV file
Weekly_data<- read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/PedFluDeath_WeeklyData.csv")
rawdata <- Weekly_data
x_axis <- Weekly_data$WEEK.NUMBER[c(6*c(1:32))]
SeasonDeath_data<-read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/Season_Deaths.csv")
Weekly_data <- subset(Weekly_data, select =-c(1))

## Melting data for plotting
Data = melt(Weekly_data, id=c("WEEK.NUMBER"))

## Plot the chart
p<-ggplot(Data,aes(x=WEEK.NUMBER, y=value, fill=variable)) +
  geom_bar(stat="identity", position="stack", colour="black") +
  scale_fill_manual(name = "Week of Death",
                    labels = c("Deaths Reported Current Week", "Deaths Reported in Previous Week"),
                    values = c("CURRENT.WEEK.DEATHS"="cyan", "PREVIOUS.WEEKS.DEATHS"="forestgreen")) +
  labs(x="", y="Number of deaths", fill=NULL)

#b<-p+scale_fill_brewer(palette = "Set1")
b<- p+ theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                          axis.text.x=element_text(angle=90, size=8, face="bold", color="black"),
                          legend.position= "bottom")
b <- b + scale_y_continuous(limit = c(0, 30))+
  scale_x_discrete(breaks=x_axis,
                   labels=x_axis)+
  
## Including annotations
  annotate("text", x = 20, y = 20, label = SeasonDeath_data$SEASON[1], size = 4)+
  annotate("text", x = 23, y = 19, label = paste("Number of Deaths Reported =",SeasonDeath_data$TOTAL.DEATHS[1]), size = 2)+
  annotate("text", x = 70, y = 20, label = SeasonDeath_data$SEASON[2], size = 4)+
  annotate("text", x = 70, y = 19, label = paste("Number of Deaths Reported =",SeasonDeath_data$TOTAL.DEATHS[2]), size = 2)+
  annotate("text", x = 120, y = 20, label = SeasonDeath_data$SEASON[3], size = 4)+
  annotate("text", x = 120, y = 19, label = paste("Number of Deaths Reported =",SeasonDeath_data$TOTAL.DEATHS[3]), size = 2)+
  annotate("text", x = 170, y = 20, label = SeasonDeath_data$SEASON[4], size = 4)+
  annotate("text", x = 170, y = 19, label = paste("Number of Deaths Reported =",SeasonDeath_data$TOTAL.DEATHS[4]), size = 2) +
  
  ggtitle("Number of Influenza-Associated Pediatric Deaths by the Week of Death: 2014-2015 Season to Present")

## Plot data
b
