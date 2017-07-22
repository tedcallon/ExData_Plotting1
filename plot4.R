hold <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

use <- subset(hold, Date == "2/2/2007" | Date == "1/2/2007")
#rm(hold)

#turn date columns into R date object, combine with Time column, then turn Time column
#into R Date/Time object
use$Date <- as.Date(use$Date, format = "%d/%m/%Y")
use$Time <- paste(use$Date, use$Time)
use$Time <- strptime(use$Time, format = "%Y-%m-%d %H:%M:%S")

##plot 4

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(5,4,4,4))
#plot 1
plot(y = as.numeric(use$Global_active_power), x = use$Time, type = "l", xlab = "",
     ylab = "Global Active Power")

#plot 2
plot(y = use$Voltage, x = use$Time, type = "l", xlab = "datetime",
     ylab = "Voltage")

#plot 3
plot(y = use$Sub_metering_1, x = use$Time, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(y = use$Sub_metering_2, x = use$Time, col = "red")
lines(y = use$Sub_metering_3, x = use$Time, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, lty = 1)

#plot 4
plot(y = use$Global_reactive_power, x = use$Time, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
