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

# To Create Plot1:
png(filename = "plot1.png")
hist(hpc$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()