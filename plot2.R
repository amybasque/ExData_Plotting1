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

## Create plot.
plot(df$DateTime, df$Global_active_power, type="l", col="black", main="", xlab ="", ylab="Global Active Power (kilowatts)")

## Create png of plot. 
dev.copy(png, file = "plot2.png")
dev.off()