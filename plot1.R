epc <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
epcs <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot1.png",width = 480,height = 480,units = "px")
epcs$Global_active_power <- as.numeric(levels(epcs$Global_active_power))[epcs$Global_active_power]
hist(epcs$Global_active_power,xlab = "Global Active Power(killowatts)",main = "Global Active Power",col="red")
dev.off()