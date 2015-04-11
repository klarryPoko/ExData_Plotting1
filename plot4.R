## reads the power consumption data, subset 1/2/2007 and 2/2/2007.
## change the date from a factor to a date
## combine Date and Time into one variable
## creates 4 plots of DateTime VS Active power, sub_merting 1,2&3, voltage and reactive power 
## and stores it in a file called plot4.png
plot4<-function(){
      x<-read.table("./household_power_consumption.txt", sep=";", header =TRUE, na.strings="?" )
      data<-subset(x, Date=="1/2/2007" | Date=="2/2/2007")
      data[,1]<-as.Date(data[ , 1], format="%d/%m/%Y")
      dt<-as.POSIXct(paste(z$Date,z$Time),format="%Y-%m-%d %H:%M:%S")
      
      png(file="plot4.png", width=480, height=480)
            par(mfcol=c(2,2))
      ##Plot Active power vs DT
            plot(dt, data$Global_active_power, ylab="Global Active Power (kilowatts)", type="n", xlab="")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  z$Global_active_power)
      ##Plot sub metering vs DT
            plot(dt, data$Sub_metering_1, ylab="Energy sub metering", type="n", xlab="")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  data$Sub_metering_1)
            lines(dt,  data$Sub_metering_2, col="red")
            lines(dt,  data$Sub_metering_3, col="blue")
            legend("topright",bty="n",lwd=2, cex=0.9,y.intersp=1.1, col=c("black","red","blue"), lty=c(1,1,1), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      ## Plot voltage vs DT
            plot(dt, data$Voltage, ylab="Voltage", type="n", xlab="datetime")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  z$Voltage)
      ## Plot Reactive power VS DT
            plot(dt, data$Global_reactive_power, ylab="Global_reactive_power", type="n", xlab="datetime")
            axis(side=1, at=seq(1,5,by=2), labels=c("Thu","Fri", "Sat"))
            lines(dt,  z$Global_reactive_power)
     
      dev.off()
      data
}