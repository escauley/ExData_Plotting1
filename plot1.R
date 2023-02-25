# Plot 1 from Week 1 Project for Exploratory Data Analysis Course

library(dplyr)

#Load the data
uciEpcData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# Change the class type of the numeric columns
uciEpcData$Global_active_power <- as.numeric(uciEpcData$Global_active_power)

# Filter only for the dates of interest
targetDates <- c("1/2/2007", "2/2/2007")
uciEpcDataSubset <- filter(uciEpcData, Date %in% targetDates)

# Create the plot
png(width = 480, height = 480, filename = "plot1.png")
with(uciEpcDataSubset, hist(Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

