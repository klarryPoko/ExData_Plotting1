## reads the power consumption data, subset 1/2/2007 and 2/2/2007.
## change the date from a factor to a date
## combine Date and Time into one variable
## creates a plot of DateTime VS sub_merting 1,2&3 and stores it in a file called plot3.png
plot3<-function(){
      x<-read.table("./household_power_consumption.txt", sep=";", header =TRUE, na.strings="?" )
      data<-subset(x, Date=="1/2/2007" | Date=="2/2/2007")
      data[,1]<-as.Date(data[ , 1], format="%d/%m/%Y")
      dt<-as.POSIXct(paste(z$Date,z$Time),format="%Y-%m-%d %H:%M:%S")
      
      png(file="plot3.png", width=480, height=480)
            plot(dt, data$Sub_metering_1, ylab="Energy sub metering", type="n", xlab="")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  data$Sub_metering_1)
            lines(dt,  data$Sub_metering_2, col="red")
            lines(dt,  data$Sub_metering_3, col="blue")
            legend("topright",lwd=2, cex=1.2,y.intersp=1.4, col=c("black","red","blue"), lty=c(1,1,1), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      dev.off()
      data
}