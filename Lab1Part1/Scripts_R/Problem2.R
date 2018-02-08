# Read a table and plot a bar chart of the data

sales<-read.table("./Test_Data/salesdata.txt", header=T)
sales # to verify that data has been read
barplot(as.matrix(sales), main="Sales Data", ylab= "Total",beside=T, col=rainbow(5))ls
