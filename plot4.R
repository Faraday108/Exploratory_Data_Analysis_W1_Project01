library(tidyverse)

dat <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

Feb_01_02 <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
Feb_01_02$Time <- strptime(paste(Feb_01_02$Date, Feb_01_02$Time), 
                           format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, unit = "px")

par(mfrow = c(2,2))
# Upper left: Global active power vs date
plot(Feb_01_02$Time,Feb_01_02$Global_active_power, type = "l", col = "black", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
# Upper right: voltage vs date
plot(Feb_01_02$Time,Feb_01_02$Voltage, type = "l", col = "black", 
     xlab = "datetime", ylab = "Voltage")
# Lower left: sub metering vs date
plot(Feb_01_02$Time,Feb_01_02$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy Sub Metering")
points(Feb_01_02$Time,Feb_01_02$Sub_metering_2, type = "l", col = "red")
points(Feb_01_02$Time,Feb_01_02$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"))
# Lower right: global reactive power vs date
plot(Feb_01_02$Time,Feb_01_02$Global_reactive_power, type = "l", col = "black", 
     xlab = "datetime", ylab = "Global_Reactive_Power")
dev.off()
