library(reshape2)
library(ggplot2)
rm(list =ls())

## Read dataset in CSV format
data <- read.csv("../Data/Postive Tested/Workbook1.csv")

# Manipulating data for plotting and melting the data finally
data <- data[ -c(5) ]
data <- data[c(1,5,2:4,6:9)]
data <- subset( data, select = -Total...Tested )
data <- data[-c(18, 19, 20, 21, 22), ]
data <- t(data)
colnames(data) <- data[1, ] 
data <- data[-1, ]
label=c("2017W40","2017W41","2017W42","2017W43","2017W44","2017W45","2017W46","2017W47","2017W48","2017W49","2017W50","2017W51","2017W52","2018W01","2018W02","2018W03","2018W04")
colnames(data)= label
data <- melt(data)

#Changing the column name of melted data
label=c("Type.of.disease", "Week", "Total")
colnames(data) <- label

# Plotting stacked bar charts
ggplot(data, aes(x=Week, y=Total, fill=Type.of.disease)) + 
  geom_bar(stat="identity", colour = "black") +
  xlab("\n Weeks") +
  ylab("Number of Postive Specimens\n") +
  scale_fill_manual(values = c("orange","red","blue","yellow","green4","yellow3", "limegreen")) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(face="bold", color="black",size=8, angle=90),
        axis.text.y = element_text(face="bold", color="black",size=8),
        legend.position=c(0.4, 0.7))+ 
        scale_y_continuous(limits = c(0,4000), breaks = c(500*c(1:10))) +
ggtitle("Influenza National Summary of Postive Tests Reported to CDC by U.S Public Health")

