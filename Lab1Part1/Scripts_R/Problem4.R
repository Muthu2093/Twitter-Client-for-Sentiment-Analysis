#Problem 4
#Comparison of data in csv files

fb1<-read.csv("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part1/Test_Data/FB.csv")
aapl1<-read.csv("/Users/muthuvel/Documents/GitHub/Twitter-client-for-Data-Collection-and-Exploratory-Data-Analysis-/Lab1Part1/Test_Data/AAPL.csv")

par(bg="cornsilk")
plot(aapl1$Adj.Close, col="blue", type="o", ylim=c(150,200), xlab="Days", ylab="Price" ) 
lines(fb1$Adj.Close, type="o", pch=22, lty=2, col="red")
legend("topright", inset=.05, c("Apple","Facebook"), fill=c("blue","red"), horiz=TRUE)

hist(aapl1$Adj.Close, col=rainbow(8))