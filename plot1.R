library("lubridate")

electric <- read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

electric$Date <- mdy(electric$Date)
electric$Time <- hms(electric$Time)

esub <- subset(electric, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

png(filename = "plot1.png", width=480, height=480)
hist(esub$Global_active_power,main="Global Active Power",axes = FALSE,xlim = c(0,6), ylim = c(0,1200),breaks=12,col='red',xlab="Global Active Power (kilowatts)")
xticks <- c(0,2,4,6)
axis(1,at=xticks,label=xticks)
yticks <- c(0,200,400,600,800,1000,1200)
axis(2,at=yticks,labels=yticks)
title(xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()