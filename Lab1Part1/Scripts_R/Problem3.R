# Problem 3
# Using Boxplot to visualize and compare 2 sales data

fn<-boxplot(sales,col=c("orange","green"))$stats
text(1.45, fn[3,2], paste("Median =", fn[3,2]), adj=0, cex=.7) 
text(0.45, fn[3,1],paste("Median =", fn[3,1]), adj=0, cex=.7) 
grid(nx=NA, ny=NULL)

