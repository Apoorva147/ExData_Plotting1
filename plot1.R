consumedata <- "household_power_consumption.txt"
dataread <- read.table(consumedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
selectedData <- dataread[dataread$Date %in% c("1/2/2007","2/2/2007") ,]

#numeric creates a double-precision vector of the specified length with each element equal to 0
globalActivePower <- as.numeric(selectedData$Global_active_power)

#Saving output to plot1 with 480*480
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
