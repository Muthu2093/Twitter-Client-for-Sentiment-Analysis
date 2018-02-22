rm(list =ls())

library(maps)

setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Scripts")
data <- read.csv("../Data/Heat Map/heatmap.csv")

states=data$STATENAME
activityLevel <- data$ACTIVITY.LEVEL


activityLevel <- gsub("Level 10","10", activityLevel)
activityLevel <- gsub("Level 9","9", activityLevel)
activityLevel <- gsub("Level 8","8", activityLevel)
activityLevel <- gsub("Level 7","7", activityLevel)
activityLevel <- gsub("Level 6","6", activityLevel)
activityLevel <- gsub("Level 5","5", activityLevel)
activityLevel <- gsub("Level 4","4", activityLevel)
activityLevel <- gsub("Level 3","3", activityLevel)
activityLevel <- gsub("Level 2","2", activityLevel)
activityLevel <- gsub("Level 1","1", activityLevel)
activityLevel <- gsub("Level 0","0", activityLevel)

df_activityLevel=data.frame(activityLevel)
#heatmap(df_activityLevel(,1))


#df <- melt(data.frame(data$STATENAME, data$ACTIVITY.LEVEL, activityLevel))
library(fiftystater)
map(database = 'state',regions=data$STATENAME,  fill=TRUE, col=activityLevel,
    resolution=0)

heatmap colors()
fiftystates
