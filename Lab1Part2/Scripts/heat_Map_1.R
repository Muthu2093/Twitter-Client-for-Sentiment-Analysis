rm(list =ls())

library(maps)

setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part2/Scripts")
data <- read.csv("../Data/Heat Map/heatmap.csv")

states=data$STATENAME
activityLevel <- data$ACTIVITY.LEVEL

