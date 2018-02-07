#Need to check how to convert geocode of location - geocode()

library("ggmap")
library("maptools")
library(maps)
visited <- c("SFO", "Buffalo", "London", "Melbourne", "Lima, Peru","Johannesburg, SA")
ll.visited <- geocode(visited)
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat
map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))

points(visit.x,visit.y, col="red", pch=36)