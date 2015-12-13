thefile <- unzip("exdata-data-household_power_consumption.zip")
data <- read.table(thefile,head=TRUE,sep=";",na.string="?")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data2$DateTimeStr <- g <- mapply(function(x,y){
    paste(c(x, y), collapse=" ")
  }, x=as.character(data2$Date),y=as.character(data2$Time)) 
data2$NewTime <- strptime(data2$DateTimeStr, format="%Y-%m-%d %H:%M:%S")

plot(data2$NewTime,data2$Global_active_power, type="l",xlab="", 
  ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
