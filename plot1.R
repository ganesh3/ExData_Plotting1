# read the table
housedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# remove NA values
housedata <-na.omit(housedata)

# subset date
housedata <- housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

# convert date
housedata$Date <- strptime(paste(housedata$Date,housedata$Time), "%d/%m/%Y %H:%M:%S")