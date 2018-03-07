library(ggplot2)
library(maps)
library(fiftystater)
library(maps)

data <- read.csv("../data_collected/statesFrequency")
data<- subset(data, select = -c(X)) #removing column named X
setwd("../Scripts")


alpha = sort(table(data), decreasing = TRUE)
data("fifty_states")

checker <- data.frame(state.name)
colnames(checker) <- c("state")
rownames <- rownames(alpha)
rownames(alpha) <- NULL
alpha <- data.frame(cbind(rownames,alpha))
colnames(alpha) <- c("state", "count")
pointer = 1

for (i in 1:nrow(alpha))
{
  for (j in 1:nrow(checker))
  {
    if (as.character(alpha$state[i])==as.character(checker$state[j]))
    {
      if (pointer == 1)
      {
        temp = alpha[i,]
        pointer = 2
      }
      if (pointer == 2)
      {
        temp = rbind(temp,alpha[i,])
      }
    }
  }
}