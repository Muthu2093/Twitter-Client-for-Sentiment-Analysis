# Problem 5
# Exploring dataset in R
# Using UKgas dataset. 
# Attach and Detach is commented since it is not a list, data frame or environment

data()
#attach(UKgas)
head(UKgas)
summary(UKgas)
#detach(UKgas)

library (help=datasets) 
library(datasets)
head(UKgas)
plot(UKgas)