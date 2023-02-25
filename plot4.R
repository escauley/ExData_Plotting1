# Plot 4 from Week 1 Project for Exploratory Data Analysis Course

library(dplyr)

#Load the data
uciEpcData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# Change the class type of the numeric columns
uciEpcData$Global_active_power <- as.numeric(uciEpcData$Global_active_power)

# Filter only for the dates of interest
targetDates <- c("1/2/2007", "2/2/2007")
uciEpcDataSubset <- filter(uciEpcData, Date %in% targetDates)

# Create a column for the combined date and time
uciEpcDataSubset$DateTime <- paste(uciEpcDataSubset$Date, uciEpcDataSubset$Time)
uciEpcDataSubset$DateTime <- as.POSIXct(uciEpcDataSubset$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Create the plot
png(width = 480, height = 480, filename = "plot4.png")

par(mfrow = c(2, 2))

with(uciEpcDataSubset, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(uciEpcDataSubset, plot(DateTime, Voltage, type="l", ylab = "Voltage"))

with(uciEpcDataSubset, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(uciEpcDataSubset, lines(DateTime, Sub_metering_2, col = "red"))
with(uciEpcDataSubset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = NULL, bty = "n", border = NULL, col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with(uciEpcDataSubset, plot(DateTime, Global_reactive_power, type="l", ylab = "Global_reactive_power"))

dev.off()

