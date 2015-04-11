## reads the power consumption data, subset 1/2/2007 and 2/2/2007.
## change the date from a factor to a date
## combine Date and Time into one variable
## creates a plot of DateTime VS Global_active_power and stores it in a file called plot2.png
plot2<-function(){
      x<-read.table("./household_power_consumption.txt", sep=";", header =TRUE, na.strings="?" )
      data<-subset(x, Date=="1/2/2007" | Date=="2/2/2007")
      data[,1]<-as.Date(data[ , 1], format="%d/%m/%Y")
      dt<-as.POSIXct(paste(z$Date,z$Time),format="%Y-%m-%d %H:%M:%S")
   
      png(file="plot2.png", width=480, height=480)
            plot(dt, data$Global_active_power, ylab="Global Active Power (kilowatts)", type="n", xlab="")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  z$Global_active_power)
      dev.off()
      data
   

}