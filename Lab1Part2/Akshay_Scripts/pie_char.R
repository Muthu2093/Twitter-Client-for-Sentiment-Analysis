rm(list =ls())
library(ggplot2)
library(gridExtra)
library(ggpubr)

data<- read.csv("../Data/Influenza sub type pie charts/Genetic04.csv")

mydata_1<- data[9:11,]
mydata_1<- mydata_1[-c(1 )]

## Pie char 1
bp_1<- ggplot(mydata_1, aes(x="", y=Number, fill= mydata_1$Genetic_Group))+
  geom_bar(width = 1, stat = "identity") + #guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("3C.2a" = "indianred1", "3C.2a1" = "mistyrose", "3C.3a" = "firebrick3")) +
  ggtitle("Influenza A(H3N2)") +
  theme(plot.title=element_text(hjust=0.5, size = 8))+
  xlab("")+
  ylab("")
  

pie_1 <- bp_1 + coord_polar("y", start=250) +  
  theme_minimal()+ 
  theme_bw()
pie_1

annotate("text", x = 20, y = 20, label = "2014 -2015", size = 4)

mydata_2<- data[6,]
mydata_2<- mydata_2[-c(1)]

## Pie chat 2
bp_2<- ggplot(mydata_2, aes(x="", y=Number, fill= mydata_2$Genetic_Group))+
  geom_bar(width=1, stat ="identity")+ #guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("6B.1" = "navajowhite2")) +
  ggtitle("Influenza A(H1N1)pdm09") +
  theme(plot.title=element_text(hjust=0.5, size = 8)) +
  xlab("")+
  ylab("")
  
  
pie_2 <- bp_2 + coord_polar("y", start=250) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+ 
  theme_bw()
pie_2

mydata_3<- data[1:2,]
mydata_3<- mydata_3[-c(1 )]


## Pie chat 3
bp_3<- ggplot(mydata_3, aes(x="", y=Number, fill= mydata_3$Genetic_Group))+
  geom_bar(width = 1, stat = "identity")+ #guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("V1A" = "darkolivegreen1", "V1A-2Del" = "darkolivegreen1")) +
  ggtitle("Influenza B Victoria") +
  theme(plot.title=element_text(hjust=0.5, size = 8)) +
  xlab("")+
  ylab("")
  
pie_3 <- bp_3 + coord_polar("y", start=550) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+ 
  theme_bw()
pie_3

mydata_4<- data[3,]
mydata_4<- mydata_4[-c(1 )]


## Pie chat 4
bp_4<- ggplot(mydata_4, aes(x="", y=Number ,fill=mydata_4$Genetic_Group))+
  geom_bar(width = 1, stat = "identity")+ #guides(fill=FALSE) +
  scale_fill_manual("legend", values = c("Y3" = "olivedrab3"))+
  ggtitle("Influenza B Yamagata") +
  theme(plot.title=element_text(hjust=0.5, size = 8)) +
  xlab("")+
  ylab("")


pie_4 <- bp_4 + coord_polar("y", start=0) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank()) + 
  theme_bw()
pie_4 

## ## Pie chat 5 - Main chart
df <- data.frame(
  group = c("Influenza A H3N2", "Influenza A (H1N1)pdm09", "Influenza A(Subtype Unknown)", "Influenza B Victoria",
            "Influenza B Yamagata" , "Influenza B(lineage not determined)"),
  value = c(18068, 1896, 348,228, 2292,921))

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values= c("Influenza A H3N2"="red","Influenza A (H1N1)pdm09"="forestgreen", "Influenza A(Subtype Unknown)" ="orange",
                              "Influenza B Victoria"="yellow", "Influenza B Yamagata"= "green","Influenza B(lineage not determined)"="cyan")) +
  ggtitle("Influenza Positive Specimens \nReported by US Public\n Health Laboratories") +
  theme(plot.title=element_text(hjust=0.5, size = 8),
        legend.position = "right") +
  xlab("")+
  ylab("")

a <- plot.new()
pie <- bp + coord_polar("y", start=0) #+guides(fill=FALSE) 


## Grouping all charts into one using ggarrange
ggarrange(pie, pie_1,pie_2,a ,pie_3,pie_4, ncol=3, nrow=2)
