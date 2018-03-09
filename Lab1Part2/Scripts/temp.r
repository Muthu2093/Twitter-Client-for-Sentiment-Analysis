library(reshape2)
library(ggplot2)

rm(list =ls())

data_NS <- read.csv("../Data/INS/INS.csv")
#data_NS <- subset( data, select =  -c(X..Positive ,Total...Tested ,Percent.Positive.B, Percent.Positive.A))
colnames(data_NS) <- c("Week","A","B", "% postive flu A", "% postive flu B", "Total", "Positive")


#colnames(data_NS) <- c("Week","A","B")
data_NS <- t(data_NS)
colnames(data_NS) <- data_NS[1, ] 
data_NS <- data_NS[-1, ]

label=c("2017W40","2017W41","2017W42","2017W43","2017W44","2017W45","2017W46","2017W47","2017W48","2017W49","2017W50","2017W51","2017W52","2018W01","2018W02","2018W03","2018W04")
colnames(data_NS)= label
data_NS <- melt(data_NS)
#label=c("40","41","42","43","44","45","46","47","48","49","50","51","52","1","2","3","4")


label=c("Type", "Week", "Total")
colnames(data_NS) <- label

plotS1 <- ggplot(data_NS) 
plotS1 +  geom_bar(aes(x=Week,y=Total,factor=Type,fill=Type, stat="identity")) +
  geom_line(data=data_NS1, aes(x=Week,y=Positive))

plot1<- ggplot(subset(data_NS, Type=="A"| Type =="B"), aes(x=Week, y=Total, fill=Type)) + 
  geom_bar(stat="identity") +
  geom_line(colour="red", linetype="dashed", size=1.5) + 
  geom_point(colour="red", size=4, shape=21, fill="white")#plot2
  #xlab("Weeks") +
  #ylab("Total Postive cases") +
  #theme_bw() +
  #scale_fill_manual(values = c("gold","darkgreen")) +
  #theme(axis.text.x = element_text(face="bold", color="black", 
  #                                       size=8, angle=45),
  #            axis.text.y = element_text(face="bold", color="black", 
  #                                       size=8))


plot1

data_NS1 <- subset( data, select =  -c(Total, `% postive flu B`, `% postive flu A`))

plot2 <- ggplot(data=data_NS1, aes(x=Week, y=Positive, group=1)) + 
  geom_line(colour="red", linetype="dashed", size=1.5) + 
  geom_point(colour="red", size=4, shape=21, fill="white")#plot2

plot2


plot3 <- ggplot() + geom_bar(aes(x = Week, y = Total, fill = Type), data = data_NS,
                          stat="identity")
plot3

plot1 + geom_line() + 
    geom_point()


#plot2












