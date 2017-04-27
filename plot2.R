## Mike Bacas | 4/26/2017 | 7:55 PM EST

## This script will reproduce the first plot or graph shown in the
## Week 1 Project for the Coursera "Exploratory Data Analysis" course.

df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## Read in the file

subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # take only the data from Jan/Feb 2007

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Create a date-time var

globalActivePower <- as.numeric(subsetData$Global_active_power)
  png("plot2.png", width=480, height=480)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
