## Collects reverseGeocodes and extract the state name from GeoCodes collected
## Automatically fetches 2500 states through revergeocode everytime you run the script
## Appends the final states to statesFrequency file

library(twitteR)
library(ggplot2)
library(ggmap)
library(data.table)

## Reading the tweet collected so far
setwd("../data_collected")
location_GeoCode <- read.csv("../data_collected/location_GeoCode")
location_GeoCode<- subset(location_GeoCode, select = -c(X)) #removing column named X
setwd("../Scripts")

## Reading the starting index of query (changed everytime you run into a file)
setwd("../data_collected")
index <- read.csv("../data_collected/index")
index <- subset(index, select = -c(X)) #removing column named X
setwd("../Scripts")

indicator <- 0
start=index$i[1]
end=index$i[1]+2500

for (i in start:end)
{
  # print(i)
  # Checking if we are exceeding the dimension of tweet input DF
  if (i>=nrow(location_GeoCode))
  {
    i=i-1
    break
  }
  a <- data.frame(revgeocode(as.numeric(location_GeoCode[i,]),output = c("more"), override_limit = TRUE))
  #if (is.na(a)) 
  #{
  #  next   
  #}
  temp <- data.frame(a$administrative_area_level_1)
  
  if (indicator == 0)
  {
    states = temp
    indicator <- 1
  }
  
  if (indicator != 0)
  {
    states = rbind(states,temp)
  }
}

i=i+1

## Storing the last index of reverserGeocode to set the starting point of next query 
setwd("../data_collected")
write.csv(data.frame(i), file = "index") 
setwd("../Scripts")

## Reading the states extracted from reverse_geocode  so far
setwd("../data_collected")
statesFrequency <- read.csv("../data_collected/statesFrequency")
statesFrequency<- subset(statesFrequency, select = -c(X)) #removing column named X
setwd("../Scripts")

## Writing the conslidated states to csv file
statesFrequency = rbind(statesFrequency,states)
setwd("../data_collected")
write.csv(statesFrequency, file = "statesFrequency") 
setwd("../Scripts")

