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
#plot
plot(inputData$Date , inputData$Global_active_power, main = "Global Active Power", ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#Copy plot to a PNG file
dev.copy(png, file = "plot2.png")
#close PNG device
dev.off()