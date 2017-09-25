
consumedata <- "household_power_consumption.txt"
dataread <- read.table(consumedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
selectedData <- dataread[dataread$Date %in% c("1/2/2007","2/2/2007") ,]

#paste will Concatenate vectors after converting to character.
datetime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)

#Saving output to plot2 with 480*480
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

