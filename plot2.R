# Plot 2 from Week 1 Project for Exploratory Data Analysis Course

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
png(width = 480, height = 480, filename = "plot2.png")
with(uciEpcDataSubset, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

