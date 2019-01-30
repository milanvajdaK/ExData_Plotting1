Sys.setlocale(category = "LC_ALL", locale = "english")
data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.string="?")
data["DateTime"]<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%OS")
data2days<-subset(data, DateTime>=as.POSIXct("2007-02-01")&DateTime<as.POSIXct("2007-02-03"))

png(file="plot4.png")
par(mfcol=c(2,2))

plot(data2days$DateTime, data2days$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

with(data2days, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(data2days, lines(DateTime, Sub_metering_1, type="l", col="black"))
with(data2days, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(data2days, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1, 1), bty = "n")

plot(data2days$DateTime, data2days$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data2days$DateTime, data2days$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()