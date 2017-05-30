fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)

df<- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"),] 

df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")

dev.off()