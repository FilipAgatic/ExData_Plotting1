# clean workspace
rm(list = ls(all = TRUE))
# get yourself in the right directory and load the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data$Date <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,format = "%Y-%m-%d %H:%M:%S")
#times <- strptime(paste(data$Date, data$Time, sep = " "), 
#                  format = "%Y-%m-%d %H:%M:%S")
#data$Time <- strptime(data$Time, format = "%H:%M:%S")
# subset the data to just 2 days of choice: 2007-02-01 and 2007-02-02
dataS <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
dataS$Sub_metering_1 <- as.numeric(as.character(dataS$Sub_metering_1))
dataS$Sub_metering_2 <- as.numeric(as.character(dataS$Sub_metering_2))
dataS$Sub_metering_3 <- as.numeric(as.character(dataS$Sub_metering_3))
# plot of global active power by time
png("Plot3.png")
plot(dataS$DateTime,dataS$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "l")
lines(dataS$DateTime,dataS$Sub_metering_2, col = "red")
lines(dataS$DateTime,dataS$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,
       col = c("black","red", "blue"))

dev.off()