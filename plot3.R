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
#plot sub-meter 1, 2, 3
plot(inputData$Date, inputData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(inputData$Date, inputData$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(inputData$Date, inputData$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex=0.75, lwd=0.75)
#Copy plot to a PNG file
dev.copy(png, file = "plot3.png")
#close PNG device
dev.off()