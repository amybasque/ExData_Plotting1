power_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(power_url, temp)
unzip(temp, "household_power_consumption.txt")

##Read in data to create data frame. 
fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)
unlink(temp)

## Pull out only data for two dates needed. 
df<- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"),] 

## Create new datetime variable. 
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Set up 4x4 grid for plots. 
par(mfrow=c(2,2))

## Create plots.
plot(df$DateTime, df$Global_active_power, type="l", col="black", main="", xlab ="", ylab="Global Active Power")
plot(df$DateTime, df$Voltage, type="l", col="black", main="", xlab ="datetime", ylab="Voltage")
plot(df$DateTime, df$Sub_metering_1, type="l", col="black", main="", xlab ="", ylab="Energy sub metering")
	lines(df$DateTime, df$Sub_metering_2, col="red")
	lines(df$DateTime, df$Sub_metering_3, col="blue")
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"))
plot(df$DateTime, df$Global_reactive_power, type="l", col="black", main="", xlab ="datetime", ylab="Global_reactive_power")



## Create png of plot. 
dev.copy(png, file = "plot4.png")
dev.off()