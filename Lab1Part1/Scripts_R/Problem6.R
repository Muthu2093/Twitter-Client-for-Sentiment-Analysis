# Using ggmap function to plot location of places

library("ggmap")
library("maptools")
library(maps)
visited <- c("SFO", "Chennai", "Melbourne", "Sydney", "Lima, Peru","Bangalor", "San Jose")
ll.visited <- geocode(visited)
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat
map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))

points(visit.x,visit.y, col="red", pch=36)
