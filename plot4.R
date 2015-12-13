thefile <- unzip("exdata-data-household_power_consumption.zip")
data <- read.table(thefile,head=TRUE,sep=";",na.string="?")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data2$DateTimeStr <- g <- mapply(function(x,y){
  paste(c(x, y), collapse=" ")
}, x=as.character(data2$Date),y=as.character(data2$Time)) 
data2$NewTime <- strptime(data2$DateTimeStr, format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
#plot(1,1)
plot(data2$NewTime,data2$Global_active_power, type="l",xlab="", 
     ylab = "Global Active Power")
#plot(1,2)
plot(data2$NewTime,data2$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot(2,1)
plot(data2$NewTime, data2$Sub_metering_1,type="l",col="black", xlab="",
     ylab ="Energy sub metering")
lines(data2$NewTime, data2$Sub_metering_2,type="l",col="red")
lines(data2$NewTime, data2$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lwd="1",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
#plot(2,2)
plot(data2$NewTime,data2$Global_reactive_power,type="l",col="black",xlab="datetime",
     ylab="Global_reactive_power")
dev.copy(png,"plot4.png")
dev.off()
