# Read data

data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE, dec = ".",
                   check.names = FALSE, comment.char = "", quote = '\"' )

# Subset needed data based on Date

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))


# Convert Date and Time

data1$Date <- as.Date(data1$Date, format = "%d/ %m/ %Y")

#Add days

datedays <- paste(as.Date(data1$Date), data1$Time)
data1$Datedays <- as.POSIXct(datedays)

#Plot

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datedays, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datedays, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datedays, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datedays,col='Red')
  lines(Sub_metering_3~Datedays,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datedays, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#Create File

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off