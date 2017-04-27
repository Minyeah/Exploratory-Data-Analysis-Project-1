## Mike Bacas | 4/26/2017 | 8:05 PM EST

## This script will reproduce the first plot or graph shown in the
## Week 1 Project for the Coursera "Exploratory Data Analysis" course.

df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## Read in the file

subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # take only the data from Jan/Feb 2007

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Create a date-time var
globalActivePower <- as.numeric(subsetData$Global_active_power)

subMetering1 <- as.numeric(subsetData$Sub_metering_1) ## define the separate submeasured variables
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


