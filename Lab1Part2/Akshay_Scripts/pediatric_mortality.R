rm(list =ls())
library(ggplot2)

Weekly_data<- read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/PedFluDeath_WeeklyData.csv")

x_axis <- Weekly_data$WEEK.NUMBER[c(6*c(1:32))]
#x_axis=Weekly_data[1:20,]
#x_axis=x_axis[c(2)]

SeasonDeath_data<-read.csv("../Data/Number of Influenza-Associated Pediatric Deaths/Season_Deaths.csv")

p<-ggplot(Weekly_data,aes(x=WEEK.NUMBER, y=PREVIOUS.WEEKS.DEATHS)) +
  geom_bar(stat="identity", fill = "forestgreen", position="stack", colour="black") +
  labs(x="Week of Death", y="Number of deaths", fill=NULL)
  
b<-p+scale_fill_brewer(palette = "Set1")
b<- b+ theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
               axis.text.x=element_text(angle=90, size=8, face="bold", color="black"))
b <- b + scale_y_continuous(limit = c(0, 30))+
    scale_x_discrete(breaks=x_axis,
                        labels=x_axis)
b
  