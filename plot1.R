# Read data

data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE, dec = ".",
                   check.names = FALSE, comment.char = "", quote = '\"' )

# Subset needed data based on Date

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))


# Convert Date and Time

data1$Date <- as.Date(data1$Date, format = "%d %m %Y")

# Plot histagram

hist(data1$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")

# Create file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
