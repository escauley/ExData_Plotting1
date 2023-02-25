#Downkoad the data for the week 1 project

dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
uciEpcFile <- "uci_epc_data.zip"
download.file(dataUrl, uciEpcFile)
unzip(uciEpcFile, exdir = ".")