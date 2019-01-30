Sys.setlocale(category = "LC_ALL", locale = "english")
data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.string="?")
data["DateTime"]<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%OS")
data2days<-subset(data, DateTime>=as.POSIXct("2007-02-01")&DateTime<as.POSIXct("2007-02-03"))

png(file="plot2.png")
plot(data2days$DateTime, data2days$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()