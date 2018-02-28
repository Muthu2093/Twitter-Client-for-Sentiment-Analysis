# loading the required packages
library(ggplot2)
library(ggmap)

# creating a sample data.frame with your lat/lon points
lat <- c(49.34, 24.7433195)
lon <- c(-124.7844079,-66.9513812)
df <- as.data.frame(cbind(lon,lat))

# getting the map
mapgilbert <- get_map(location = c(40.00,-70.00), zoom = 4,
                      maptype = "satellite", scale = 2)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = df, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)
