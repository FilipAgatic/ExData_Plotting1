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
dataS$Voltage <- as.numeric(as.character(dataS$Voltage))
dataS$Global_reactive_power <- as.numeric(as.character(dataS$Global_reactive_power))
dataS$Global_active_power <- as.numeric(as.character(dataS$Global_active_power))
png("Plot4.png")
#' make subplots
par(mfrow = c(2,2))
# 1) global active power
plot(dataS$DateTime,dataS$Global_active_power, 
     ylab = "Global Active Power", xlab = "", type = "l")
# 2) voltage
plot(dataS$DateTime,dataS$Voltage, 
     ylab = "Voltage", xlab = "datetime", type = "l")
# 3) sub metering
plot(dataS$DateTime,dataS$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "l")
lines(dataS$DateTime,dataS$Sub_metering_2, col = "red")
lines(dataS$DateTime,dataS$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,
       col = c("black","red", "blue"), bty = "n")
# 4) global reactive power
plot(dataS$DateTime,dataS$Global_reactive_power, 
     ylab = "global_reactive_power", xlab = "datetime",type = "l")
dev.off()