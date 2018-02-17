rm(list =ls())

## loading libraries
library(twitteR)
library(ggplot2)
library(ggmap)

## Setup oauth
setup_twitter_oauth("VxJ6qp5XL3VTclBzMBsD1Ez1A", "owezT5IVRVG8nvkSHXxqq4t2McwPO6mxesJTGU2549yHTJbP8m", "340449785-0AWt3nkBVvLlX7hbUFLl0fEqIKs47qUU7V5UnFWH", "qnaD0Pyp9jUXfwVb82RlSKikuvVi2MAWxp1J0mD1Fle4d")

## Searching for tweets ##
search.string <- "flu"
no.of.tweets <- 15000
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")

## Conversion of searched tweets to Data frame
tweets <- twListToDF(tweets)

## Eliminating duplicate users by lookingUp screenName
usernames <- tweets$screenName
temp_df <- twListToDF(lookupUsers(usernames))



#for (location in temp_df){
 # if (temp_df$location==""){
 #   print(temp_df$location)
 # }
#}

## Code to access geocode - limit 2500 per day - dont waste it
## Use it after you have extracted tweets with location info (20 to 30 maybe)
locatedUsers <- !is.na(temp_df$location)
locations <- geocode(temp_df$location[locatedUsers])

