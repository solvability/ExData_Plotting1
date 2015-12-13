thefile <- unzip("exdata-data-household_power_consumption.zip")
data <- read.table(thefile,head=TRUE,sep=";",na.string="?")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
hist(data2$Global_active_power, col = "red", main="Global Active Power",
     xlab = "Global Actitve Power(kilowatts)", xlim =c(0,6))

dev.copy(png,"plot1.png")
dev.off()
