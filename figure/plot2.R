# exploratory plots
#' this script opens the Individual household electric power consumption Data
#' Set and represents the Global Active Power of the first 2 February dates in 
#' a histogram.  

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
dataS$Global_active_power <- as.numeric(as.character(dataS$Global_active_power))
# plot of global active power by time
png("Plot2.png")
plot(dataS$DateTime,dataS$Global_active_power, main = "Global Active Power", 
     ylab = "Global Active Power (kilowatts)", xlab = "Time", type = "l")
dev.off()
