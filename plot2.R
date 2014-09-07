Plot2 <- function(data) {
	###READ THE DATA
	data.p<-read.table(data, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	data.f <- data.p[(data.p$Date == "1/2/2007") | (data.p$Date == "2/2/2007"),]
	data.f$DateTime <- strptime(paste(data.f$Date, data.f$Time), "%d/%m/%Y %H:%M:%S")
	### CREATING THE PLOT
	png(filename = "plot2.png", width = 480, height = 480, units = "px")
	plot(data.f$DateTime, data.f$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()
}
