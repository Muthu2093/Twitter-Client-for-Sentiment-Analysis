rm(list =ls())

library(maps)

setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Scripts")
data <- read.csv("../Data/Heat Map/heatmap.csv")

states=data$STATENAME
activityLevel <- data$ACTIVITY.LEVEL

activityLevel <- gsub("Level 10","red3", activityLevel)
activityLevel <- gsub("Level 9","orangered1", activityLevel)
activityLevel <- gsub("Level 8","darkorange1", activityLevel)
activityLevel <- gsub("Level 7","darkgoldenrod2", activityLevel)
activityLevel <- gsub("Level 6","yellow3", activityLevel)
activityLevel <- gsub("Level 5","yellow1", activityLevel)
activityLevel <- gsub("Level 4","greenyellow", activityLevel)
activityLevel <- gsub("Level 3","green", activityLevel)
activityLevel <- gsub("Level 2","green3", activityLevel)
activityLevel <- gsub("Level 1","green4", activityLevel)
activityLevel <- gsub("Level 0","white", activityLevel)

#df <- melt(data.frame(data$STATENAME, data$ACTIVITY.LEVEL, activityLevel))

map(database = 'state',regions=data$STATENAME,  fill=TRUE, col=activityLevel,
    resolution=0)
