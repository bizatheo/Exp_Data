Plot4 <- function(data) {
	###READ THE DATA
	data.p<-read.table(data, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	data.f <- data.p[(data.p$Date == "1/2/2007") | (data.p$Date == "2/2/2007"),]
	data.f$DateTime <- strptime(paste(data.f$Date, data.f$Time), "%d/%m/%Y %H:%M:%S")
	
	### CREATING THE PLOT
	png(filename = "plot4.png", width = 480, height = 480, units = "px")
	par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
	with(data.f, {
		plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
		plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
		cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
		plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		lines(DateTime, Sub_metering_2, type="l", col="red")
		lines(DateTime, Sub_metering_3, type="l", col="blue")
		legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
		plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
	})
	dev.off()
}