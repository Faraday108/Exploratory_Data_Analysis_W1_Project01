library(tidyverse)

dat <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

Feb_01_02 <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

png(filename = "plot1.png", width = 480, height = 480, unit = "px")
with(Feb_01_02, hist(Global_active_power, main = "Global Active Power", 
                     col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()
