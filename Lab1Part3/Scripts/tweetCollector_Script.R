rm(list =ls())

## loading libraries
library(twitteR)
library(ggplot2)
library(ggmap)
library(data.table)
## Setup oauth
setup_twitter_oauth("VxJ6qp5XL3VTclBzMBsD1Ez1A", "owezT5IVRVG8nvkSHXxqq4t2McwPO6mxesJTGU2549yHTJbP8m", "340449785-0AWt3nkBVvLlX7hbUFLl0fEqIKs47qUU7V5UnFWH", "qnaD0Pyp9jUXfwVb82RlSKikuvVi2MAWxp1J0mD1Fle4d")

## Searching for tweets ##
search.string <- "flu"
no.of.tweets <- 150
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")

## Conversion of searched tweets to Data frame
tweets <- twListToDF(tweets)

## Saving collected data to a csv file
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
Name=paste(no.of.tweets," Tweets Collected on ",Sys.time())
write.csv(tweets, file = Name)
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")

# Reading main data (tweets collected so far) to CDF
CDF=read.csv("../data_collected/consolidated_Tweets_Total")
CDF<- subset(CDF, select = -c(X)) #removing column named X

# Append new tweets to all tweets collected so far
consolidated_Tweets_Total=rbind(CDF,tweets) 
consolidated_Tweets_Total <- unique( consolidated_Tweets_Total[ , 1:16 ] ) #remove duplicates

## Saving data to csv before removing tweets without location info
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
write.csv(consolidated_Tweets_Total, file = "consolidated_Tweets_Total") 
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")


## Eliminating duplicate users by lookingUp screenName
usernames <- tweets$screenName
temp_df <- twListToDF(lookupUsers(usernames))

## Check NULL location info of users
DWL=read.csv("../data_collected/data_With_location")
DWL<- subset(DWL, select = -c(X)) #removing column named X
tweets_With_location <- subset(temp_df, temp_df$location != "")
data_With_location <- rbind(DWL, tweets_With_location) 
data_With_location <- unique( data_With_location[ , 1:17 ] )
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/data_collected")
write.csv(data_With_location, file = "data_With_location") 
setwd("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part3/Scripts")



## Code to access geocode - limit 2500 per day - dont waste it
## Use it after you have extracted tweets with location info (20 to 30 maybe)
# locatedUsers <- !is.na(tweets_with_location$location)
j<-1;
for (i in tweets_With_location$location){
  if (j==1){
    locations <- geocode(i)
  }
  if (j>1){
    locations <- rbind(locations,geocode(i))
  }
  j <- j+1
}


