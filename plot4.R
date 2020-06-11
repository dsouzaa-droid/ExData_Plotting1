dat <- read.table('household_power_consumption.txt', header=TRUE, sep=";",
                  stringsAsFactors=FALSE, dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

sub$DateTime <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$Global_reactive_power <- as.numeric(sub$Global_reactive_power)
sub$Voltage <- as.numeric(sub$Voltage)
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)

png(filename = "plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))
plot(sub$DateTime, sub$Global_active_power, ylab = "Global Active Power",
     xlab = " ", type = "l")
plot(sub$DateTime, sub$Voltage, ylab = "Voltage",
     xlab = "datetime", type = "l")
plot(sub$DateTime, sub$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(sub$DateTime, sub$Sub_metering_2, type = "l", col ="red")
lines(sub$DateTime, sub$Sub_metering_3, type = "l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(sub$DateTime, sub$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")
dev.off()