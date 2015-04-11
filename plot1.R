## reads the power consumption data, subsets 1/2/2007 and 2/2/2007.
## change the date from a factor to a date
## creates a histogram and stores it in a file called plot1.png
plot1<-function(){
      x<-read.table("./household_power_consumption.txt", sep=";", header =TRUE, na.strings="?" )
      data<-subset(x, Date=="1/2/2007" | Date=="2/2/2007")
      data[,1]<-as.Date(data[ , 1])
      png(file="plot1.png", width=480, height=480)
            hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
      dev.off()
}