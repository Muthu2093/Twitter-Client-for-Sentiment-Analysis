library(ggplot2)
library(reshape)

# First let's make a toy dataset for our stacked plot/line plot example.
data <- read.csv("../Data/INS/INS.csv")
colnames(data) <- c("Week", "A", "B", "Percent.Positive.A", "Percent.Positive.B", "Total..Tested", "Percent.Positive")
data$Week <- as.character(data$Week)
linedata1 <- data.frame(data$Week, data$Percent.Positive)
linedata2 <- data.frame(data$Week, data$Percent.Positive.A)
linedata3 <- data.frame(data$Week, data$Percent.Positive.B)

Data = melt(data,id.vars="Week")

# This plots only the line, not the stacked bar chart : 
plotS1 <- ggplot(Data[1:34,]) 
plotS1 <- plotS1 +  geom_bar(aes(x=Week,y=value, fill=variable), stat="identity", colour = "black") +
  scale_fill_manual(values = c("gold","green4"), 
                    guides(fill = "")) +

  xlab("Weeks") +
  ylab("Number of Positive Specimen")
plotS1 <- plotS1 + geom_line(data=linedata1, aes(x=data.Week,y=data.Percent.Positive*600, group=1, colour="Percent Postive"))
plotS1 <- plotS1 + geom_line(data=linedata2, aes(x=data.Week,y=data.Percent.Positive.A *600, group=1, colour="% Postive Flu A"),
  linetype="dashed", size =1.0)
plotS1 <- plotS1 + geom_line(data=linedata3, aes(x=data.Week,y=data.Percent.Positive.B *600, group=1, colour="% Postive Flu B"), 
  linetype="dashed", size =1.0)
plotS1 <- plotS1 + scale_y_continuous(sec.axis = sec_axis(~./600, name = "Percent Positive [%]"), 
                                      limit = c(0, 20000),
                                      breaks = c(2000*c(1:10))) +
  scale_color_manual(values = c('Percent Postive' = 'black', '% Postive Flu A' = 'tomato', '% Postive Flu B'= 'green2'), guides(fill = ""))
plotS1 <- plotS1 + theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(face="bold", color="black",size=8, angle=90),
        axis.text.y = element_text(face="bold", color="black",size=8),
        legend.position=c(0.4, 0.7)) +
  ggtitle("Influenza National Summary of Postive Tests Reported to CDC by U.S Clinical Laboratories")
  



plotS1

