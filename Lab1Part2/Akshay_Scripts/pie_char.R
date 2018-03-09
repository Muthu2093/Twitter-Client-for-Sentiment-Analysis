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

bp_1<- ggplot(mydata_1, aes(x="", y=Number, fill= mydata_1$Genetic_Group))+
  geom_bar(width = 1, stat = "identity") + guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("3C.2a" = "indianred1", "3C.2a1" = "mistyrose", "3C.3a" = "firebrick3"))
  

pie_1 <- bp_1 + coord_polar("y", start=250) +  theme_minimal()+ theme(axis.text.y  = element_blank(), axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid = element_blank())+ theme_bw()
pie_1

mydata_2<- data[6,]
mydata_2<- mydata_2[-c(1)]

bp_2<- ggplot(mydata_2, aes(x="", y=Number, fill= mydata_2$Genetic_Group))+
  geom_bar(width=1, stat ="identity")+ guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("6B.1" = "navajowhite2"))
  
  
pie_2 <- bp_2 + coord_polar("y", start=250) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ theme_bw()
pie_2

mydata_3<- data[1:2,]
mydata_3<- mydata_3[-c(1 )]

bp_3<- ggplot(mydata_3, aes(x="", y=Number, fill= mydata_3$Genetic_Group))+
  geom_bar(width = 1, stat = "identity")+ guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("V1A" = "darkolivegreen1", "V1A-2Del" = "darkolivegreen1"))
  


pie_3 <- bp_3 + coord_polar("y", start=550) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ theme_bw()
pie_3

mydata_4<- data[3,]
mydata_4<- mydata_4[-c(1 )]

bp_4<- ggplot(mydata_4, aes(x="", y=Number ,fill=mydata_4$Genetic_Group))+
  geom_bar(width = 1, stat = "identity")+ guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("Y3" = "olivedrab3"))+
  ggtitle("Influenza B Yamagata")


pie_4 <- bp_4 + coord_polar("y", start=0) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ theme_bw()
pie_4 


df <- data.frame(
  group = c("Influenza A H3N2", "Influenza A (H1N1)pdm09", "Influenza A(Subtype Unknown)", "Influenza B Victoria
            ", "Influenza B Yamagata" , "Influenza B(lineage not determined)"),
  value = c(18068, 1896, 348,228, 2292,921))

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start=0) +guides(fill=FALSE)
pie

ggarrange(pie, pie_1,pie_2,pie_3,pie_4, ncol=3, nrow=2)
