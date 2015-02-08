#Set Working Directory
setwd("/home/ganesh/Desktop/Exploratory Data Analysis")
# read the table
inputData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# remove NA values
inputData <-na.omit(inputData)
# subset date
inputData <- inputData[inputData$Date %in% c("1/2/2007", "2/2/2007"),]
# convert date
inputData$Date <- strptime(paste(inputData$Date,inputData$Time), "%d/%m/%Y %H:%M:%S")
#4 Plots in a graph
par(mfrow = c(2,2))
plot(inputData$Date, inputData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l", col = "black")
plot(inputData$Date, inputData$Voltage, xlab = "", ylab = "Voltage", type = "l", col = "black")
plot(inputData$Date, inputData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(inputData$Date, inputData$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(inputData$Date, inputData$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex=0.5, lwd=0.5)
with(inputData, plot(Date, Global_reactive_power, xlab = "", type = "l", col = "black"))

#Copy plot to a PNG file
dev.copy(png, file = "plot4.R.png")
#close PNG device
dev.off()