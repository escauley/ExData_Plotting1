# Plot 1 from Week 1 Project for Exploratory Data Analysis Course

library(dplyr)

# Download the data
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
uciEpcFile <- "uci_epc_data.zip"
download.file(dataUrl, uciEpcFile)

# Uncompress downloaded file and load the data
unzip(uciEpcFile, exdir = ".")
uciEpcData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

uciEpcData$Global_active_power <- as.numeric(uciEpcData$Global_active_power)
uciEpcData$Global_reactive_power <- as.numeric(uciEpcData$Global_reactive_power)
uciEpcData$Voltage <- as.numeric(uciEpcData$Voltage)
uciEpcData$Global_intensity <- as.numeric(uciEpcData$Global_intensity)
uciEpcData$Sub_metering_1 <- as.numeric(uciEpcData$Sub_metering_1)
uciEpcData$Sub_metering_2 <- as.numeric(uciEpcData$Sub_metering_2)
uciEpcData$Sub_metering_2 <- as.numeric(uciEpcData$Sub_metering_2)

targetDates <- c("1/2/2007", "2/2/2007")

uciEpcDataSubset <- filter(uciEpcData, Date %in% targetDates)

png(width = 480, height = 480, filename = "plot1.png")

with(uciEpcDataSubset,
     hist(Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
)

dev.off()

