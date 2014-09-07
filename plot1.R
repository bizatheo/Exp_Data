Plot1 <- function(data) {
	###READ THE DATA
	data.p<-read.table(data, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	data.f <- data.p[(data.p$Date == "1/2/2007") | (data.p$Date == "2/2/2007"),]
	
	### CREATING THE PLOT
	png(filename = "plot1.png", width = 480, height = 480, units = "px")
	hist(data.f$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
	dev.off()
}
