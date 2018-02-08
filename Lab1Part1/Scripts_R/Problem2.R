sales<-read.table("./Scripts_R/salesdata.txt", header=T)
sales # to verify that data has been read
barplot(as.matrix(sales), main="Sales Data", ylab= "Total",beside=T, col=rainbow(5))