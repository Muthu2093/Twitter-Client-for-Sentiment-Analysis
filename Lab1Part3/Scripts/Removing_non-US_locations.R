#library(zipcode)
#library(daff)

#data(zipcode)
## lat and lon limit for contiguous 48 states of US
## lat low = 24.oo, high =  50
## long low = -125.00, high = -66

setwd("../data_collected")
location_GeoCode <- read.csv("../data_collected/location_GeoCode")
location_GeoCode<- subset(location_GeoCode, select = -c(X)) #removing column named X
valid_US_locationGeocode <- subset(location_GeoCode, 
                                   location_GeoCode$lat >=24.00 &
                                   location_GeoCode$lat <=51.00 &
                                   location_GeoCode$lon >=-125.00 &
                                   location_GeoCode$lon <=-66.00)

#ll <- cbind(zipcode$longitude,zipcode$latitude)
#ll <- data.frame(ll)
#names(ll)[1] <- "lon"
#names(ll)[2] <- "lat"

#valid_lat <- diff_data(ll$lat, location_GeoCode$lat)
