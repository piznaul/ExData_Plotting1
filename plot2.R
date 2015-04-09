library("lubridate")

electric <- read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

electric$Date <- as.character(electric$Date)
electric$Time <- as.character(electric$Time)
electric$dt <- mdy_hms(paste(electric$Date,electric$Time))
electric$Date <- mdy(electric$Date)

esub <- subset(electric, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))



png(filename = "plot2.png", width=480, height=480)
plot(esub$dt,esub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()