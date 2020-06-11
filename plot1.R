dat <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$Time <- strptime(sub$Time, format = "%H:%M:%S")
sub$Global_active_power <- as.numeric(sub$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(sub$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()