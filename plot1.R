hold <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

use <- subset(hold, Date == "2/2/2007" | Date == "1/2/2007")
rm(hold)

##plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(use$Global_active_power), xlab = "Global Active Power (kilowatts)", 
               ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()


