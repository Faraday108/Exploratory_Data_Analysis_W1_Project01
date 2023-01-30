library(tidyverse)

dat <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

Feb_01_02 <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
Feb_01_02$Time <- strptime(paste(Feb_01_02$Date, Feb_01_02$Time), 
                           format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, unit = "px")
plot(Feb_01_02$Time,Feb_01_02$Global_active_power, type = "l", col = "red", 
     xlab = "", ylab = "Global Active Power (kilowatts")
dev.off()
