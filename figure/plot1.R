# exploratory plots
#' this script opens the Individual household electric power consumption Data
#' Set and represents the Global Active Power of the first 2 February dates in 
#' a histogram.  

# clean workspace
rm(list = ls(all = TRUE))
# get yourself in the right directory and load the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
dateTrans <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
data$Date <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
# subset the data to just 2 days of choice: 2007-02-01 and 2007-02-02
dataS <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
dataS$Global_active_power <- as.numeric(as.character(dataS$Global_active_power))
png("plot1.png")
# histogram on global active power 
hist(dataS$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
