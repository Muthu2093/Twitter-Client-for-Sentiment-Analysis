## Script for plotting heapMAP of flu data


library(ggplot2)
library(maps)
library(fiftystater)
library(maps)

data <- read.csv("../Data/Heat Map/heatmap.csv")

## Changing ACTIVITY LEVELS IN dataset to numeric data for plotting 
data$ACTIVITY.LEVEL <- gsub("Level 10",10, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 9",9, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 8",8, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 7",7, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 6",6, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 5",5, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 4",4, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 3",3, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 2",2, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 1",1, data$ACTIVITY.LEVEL)
data$ACTIVITY.LEVEL <- gsub("Level 0",0, data$ACTIVITY.LEVEL)

data$STATENAME <- as.list(tolower(data$STATENAME))
data$STATENAME <- unlist(data$STATENAME)
data$ACTIVITY.LEVEL=as.numeric(data$ACTIVITY.LEVEL)

# Plot the heapMAP using ggplot
p <- ggplot(data, aes(map_id = STATENAME)) + 
  geom_map(aes(fill = ACTIVITY.LEVEL), map = fifty_states, color = "black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_fill_gradient2(low="yellow1", mid = "green", high="red2", midpoint = 5, guides(fill = "Activity Level"), limits=c(0,10), breaks=c(0,1,2,3,4,5,6,7,8,9,10)) +
  guides(fill = guide_colorbar(barwidth = 1.5, barheight = 20)) +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  ggtitle("2017-18 Influenza Season Week 4 ending Jan 27, 2018") +
  theme(legend.position = "right",
        plot.title = element_text(family = "Helvetica Neue", color="#666666", face="bold", size=12, hjust=0))
print(p + ggtitle("Petal and sepal length of iris"))

# Adding borders to HAWAII and ALASKA
p + fifty_states_inset_boxes()

