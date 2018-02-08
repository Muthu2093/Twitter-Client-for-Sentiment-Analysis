# Problem 2
# Read a table from text file and plotting histogram to compare the performance

sales<-read.table("../Test_Data/salesdata.txt", header=T)
sales # to verify that data has been read
barplot(as.matrix(sales), main="Sales Data", ylab= "Total",beside=T, col=rainbow(5))
