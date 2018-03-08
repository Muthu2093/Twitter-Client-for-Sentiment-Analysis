library(ggplot2)
library(maps)
library(fiftystater)
library(maps)

data <- read.csv("../data_collected/statesFrequency")
data<- subset(data, select = -c(X)) #removing column named X
setwd("../Scripts")


alpha = sort(table(data), decreasing = TRUE)
data("fifty_states")

checker <- data.frame(state.name)
colnames(checker) <- c("state")
rownames <- rownames(alpha)
rownames(alpha) <- NULL
alpha <- data.frame(cbind(rownames,alpha))
colnames(alpha) <- c("state", "count")
pointer = 1

## Code to filter and keep only the 50 - us states(48 continental + Hawaii + Alaska)
for (i in 1:nrow(alpha))
{
  for (j in 1:nrow(checker))
  {
    if (as.character(alpha$state[i])==as.character(checker$state[j]))
    {
      if (pointer == 1)
      {
        temp = alpha[i,]
        pointer = 2
        next
        
      }
      if (pointer == 2)
      {
        temp = rbind(temp,alpha[i,])
      }
    }
  }
}


## plot heat map
temp$count<-as.numeric(levels(temp$count))[temp$count]
temp$state <- unlist(as.list(tolower(temp$state)))

p <- ggplot(temp, aes(map_id = state)) + 
  geom_map(aes(fill = count), map = fifty_states, color = "black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  #scale_color_brewer(palette ="Spectral") +
  #scale_color_manual(palette = heat.colors(10))
  scale_fill_gradient2(low="green", mid="yellow", high="red3", midpoint = mean(temp$count)) +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  ggtitle("2017-18 Influenza Season Week 4 ending Jan 27, 2018") +
  theme(legend.position = "right",
        plot.title = element_text(family = "Helvetica Neue", color="#666666", face="bold", size=12, hjust=0))

print(p + ggtitle("HeatMap of Tweets on Influenza in USA"))

# add border boxes to AK/HI
p + fifty_states_inset_boxes()

