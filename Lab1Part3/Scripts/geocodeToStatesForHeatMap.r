library(zipcode)
library(compare)

data(zipcode)
a <- data.frame(trunc(location_GeoCode$lat*10^5)/10^5)
b <- data.frame(trunc(location_GeoCode$lon*10^5)/10^5)

geocodes <- cbind(b,a)
colnames(geocodes) <- c("longitude","latitude")

a<- data.frame(zipcode$latitude)
b<- data.frame(zipcode$longitude)

zip <- cbind(b,a)
colnames(zip) <- c("longitude","latitude")

## comparison <- compare(geocodes$latitude,zip$latitude)

k=1
for (i in 1:22223)
{
  if (is.na(geocodes$latitude[i])) 
  {
    next
  }
  if (is.na(geocodes$longitude[i])) 
  {
    next
  }
  for (j in 1:44336)
  {
    if (is.na(zip$latitude[j])) 
    {
      next
    }
    if (is.na(zip$longitude[j])) 
    {
      next
    }
    if (geocodes$longitude[i]==zip$longitude[j])
    {
      if (geocodes$longitude[i]==zip$longitude[j])
      {
        if (k==1)
        {
          US_states=data.frame(zipcode$state[j])
          k <- k+1
        }
        if (k!=1)
        {
          temp = data.frame(zipcocode$state[j])
          US_states= rbind(US_states,temp)
          k <- k+1
        }
      }
    }
  }
  print(i)
}

