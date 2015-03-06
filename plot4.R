library(lubridate)

# Reading the data we want
hpc <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", colClasses = "character")
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

#Formatting
hpc$Date <- dmy_hms(paste(hpc$Date, hpc$Time))
hpc$Time <- NULL
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

# To Create Plot4: 
png(filename = "plot4.png")
par(mfrow = c(2,2))
with(hpc, {
     plot(Date, Global_active_power, type = "l", ylab = "Global Active Power")
     plot(Date, Voltage, type = "l", xlab = "datetime")
     plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering")
          points(Date, Sub_metering_2, type = "l", col = "red")
          points(Date, Sub_metering_3, type = "l", col = "blue")
          legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Date, Global_reactive_power, type = "l", xlab = "datetime")
     }
)
dev.off()
