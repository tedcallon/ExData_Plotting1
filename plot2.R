hold <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

use <- subset(hold, Date == "2/2/2007" | Date == "1/2/2007")
#rm(hold)

#turn date columns into R date object, combine with Time column, then turn Time column
#into R Date/Time object
use$Date <- as.Date(use$Date, format = "%d/%m/%Y")
use$Time <- paste(use$Date, use$Time)
use$Time <- strptime(use$Time, format = "%Y-%m-%d %H:%M:%S")

##plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(y = as.numeric(use$Global_active_power), x = use$Time, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
