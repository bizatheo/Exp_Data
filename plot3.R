Plot3 <- function(data) {
	###READ THE DATA
	data.p<-read.table(data, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	data.f <- data.p[(data.p$Date == "1/2/2007") | (data.p$Date == "2/2/2007"),]
	data.f$DateTime <- strptime(paste(data.f$Date, data.f$Time), "%d/%m/%Y %H:%M:%S")
	
	### CREATING THE PLOT
	png(filename = "plot3.png", width = 480, height = 480, units = "px")
	cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	plot(data.f$DateTime,data.f$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
	lines(data.f$DateTime, data.f$Sub_metering_2, type="l", col="red")
	lines(data.f$DateTime, data.f$Sub_metering_3, type="l", col="blue")
	legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
	dev.off()
}
