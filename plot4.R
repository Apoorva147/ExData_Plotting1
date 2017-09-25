consumedata <- "household_power_consumption.txt"
dataread <- read.table(consumedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
selectedData <- dataread[dataread$Date %in% c("1/2/2007","2/2/2007") ,]  

#paste will Concatenate vectors after converting to character.
datetime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)
globalReactivePower <- as.numeric(selectedData$Global_reactive_power)
voltage <- as.numeric(selectedData$Voltage)

subMetering1 <- as.numeric(selectedData$Sub_metering_1)
subMetering2 <- as.numeric(selectedData$Sub_metering_2)
subMetering3 <- as.numeric(selectedData$Sub_metering_3)

#Saving output to plot4 with 480*480
png("plot4.png", width=480, height=480)

#With the par( ) function, you can include the option mfrow=c(nrows, ncols) to create a
#matrix of nrows x ncols plots that are filled in by row
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

