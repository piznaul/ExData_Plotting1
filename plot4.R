library("lubridate")

electric <- read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

electric$Date <- as.character(electric$Date)
electric$Time <- as.character(electric$Time)
electric$dt <- mdy_hms(paste(electric$Date,electric$Time))
electric$Date <- mdy(electric$Date)

esub <- subset(electric, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

png(filename = "plot4.png", width=480, height=480)
#set up 2x2 plot
par(mfrow = c(2,2))

#(1,1)
plot(esub$dt,esub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#(1,2)
plot(esub$dt,esub$Voltage,type="l",ylab="Voltage",xlab="datetime")

#(2,1)
plot(esub$dt,esub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black",ylim=c(0,40))
par(new=TRUE)
plot(esub$dt,esub$Sub_metering_2,type="l",ylab="",xlab="",col="red",axes=FALSE,ylim=c(0,40))
par(new=TRUE)
plot(esub$dt,esub$Sub_metering_3,type="l",ylab="",xlab="",col="blue",axes=FALSE,ylim=c(0,40))
par(new=FALSE)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#(2,2)
plot(esub$dt,esub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()