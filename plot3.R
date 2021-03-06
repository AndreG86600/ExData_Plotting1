
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

with(data1, {
  plot(Sub_metering_1~Datedays, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datedays,col='Red')
  lines(Sub_metering_3~Datedays,col='Blue')
})

#Add Legend

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
