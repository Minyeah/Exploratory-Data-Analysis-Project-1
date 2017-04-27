## Mike Bacas | 4/26/2017 | 7:45 PM EST

## This script will reproduce the first plot or graph shown in the
## Week 1 Project for the Coursera "Exploratory Data Analysis" course.

df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## Read in the file

subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # take only the data from Jan/Feb 2007

powerUsage <- as.numeric(subsetData$Global_active_power) # parses the Global active power to make sure the numeric values are taken

png("plot1.png", width=480, height=480) # initiate a png device
  hist(powerUsage, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") # plot power consumption for Jan/Feb 2007
    dev.off() # uninitiate the device