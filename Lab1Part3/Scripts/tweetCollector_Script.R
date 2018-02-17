rm(list =ls())

## loading libraries
library(twitteR)
library(ggplot2)
library(ggmap)
library(data.table)
## Setup oauth
setup_twitter_oauth("VxJ6qp5XL3VTclBzMBsD1Ez1A", "owezT5IVRVG8nvkSHXxqq4t2McwPO6mxesJTGU2549yHTJbP8m", "340449785-0AWt3nkBVvLlX7hbUFLl0fEqIKs47qUU7V5UnFWH", "qnaD0Pyp9jUXfwVb82RlSKikuvVi2MAWxp1J0mD1Fle4d")

                    

                    ############## Collection of Tweets ###################
## Searching for tweets ##
search.string <- "flu"
no.of.tweets <- 500
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")

## Conversion of searched tweets to Data frame
tweets <- twListToDF(tweets)

## Saving collected data to a csv file - only the tweets collection this session
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
Name=paste("New", no.of.tweets," Tweets Collected on ",Sys.time())
write.csv(tweets, file = Name)
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")

# Reading all tweets collected so far
CDF=read.csv("../data_collected/consolidated_Tweets_Total")
CDF<- subset(CDF, select = -c(X)) #removing column named X

# Creating a consolided data frame of all the tweets collected so far
consolidated_Tweets_Total=rbind(CDF,tweets) 
consolidated_Tweets_Total <- unique( consolidated_Tweets_Total[ , 1:16 ] ) #remove duplicates

# Saving all Tweets Collected from day 1 to csv file
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
write.csv(consolidated_Tweets_Total, file = "consolidated_Tweets_Total") 
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")



                ################# Filtering Tweets ####################
## Eliminating duplicate users by lookingUp screenName
usernames <- tweets$screenName
temp_df <- twListToDF(lookupUsers(usernames))

## Remove users without any location information
DWL=read.csv("../data_collected/data_With_location")
DWL<- subset(DWL, select = -c(X)) #removing column named X
tweets_With_location <- subset(temp_df, temp_df$location != "")
data_With_location <- rbind(DWL, tweets_With_location) 
data_With_location <- unique( data_With_location[ , 1:17 ] )

#Saving the data with location to csv file
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
write.csv(data_With_location, file = "data_With_location") 
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")





            ########################## Fetching Geocode of users #######################
## Code to access geocode - limit 2500 per day - dont waste it
## Use it after you have extracted tweets with location info (20 to 30 maybe)
# locatedUsers <- !is.na(tweets_with_location$location)
j<-1;
for (i in tweets_With_location$location){
    loc <- i
    if (stringi::stri_enc_mark(loc)=="ASCII"){
      if (j==1){
       locations <- geocode(loc)
      }
      if (j>1){
       locations <- rbind(locations,geocode(loc))
      }
      j <- j+1
    }
}

location_GeoCode <- read.csv("../data_collected/location_GeoCode")
location_GeoCode<- subset(location_GeoCode, select = -c(X)) #removing column named X
location_GeoCode <- rbind(location_GeoCode,locations)
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
write.csv(locations_GeoCode, file = "location_GeoCode") 
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")




