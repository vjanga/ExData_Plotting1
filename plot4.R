epc <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
epcs <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot4.png",width = 480,height = 480,units = "px")
epcs$Global_active_power <- as.numeric(levels(epcs$Global_active_power))[epcs$Global_active_power]
epcs <- unite(epcs,date_time,c(Date,Time),remove = TRUE,sep = " ")
epcs$date_time <- strptime(epcs$date_time, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(epcs$date_time,epcs$Global_active_power,type = "o",pch =26,ylab = "Global Active Power(killowatts)",xlab = "")
plot(epcs$date_time,epcs$Voltage,type = "o",pch =26,ylab = "Voltage",xlab = "datetime")

plot(epcs$date_time,epcs$Sub_metering_1,type = "o",pch =26,ylab = "Energy sub metering",xlab = "")
lines(epcs$date_time,epcs$Sub_metering_2,type = "o",pch =26,col="red")
lines(epcs$date_time,epcs$Sub_metering_3,type = "o",pch =26,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1,box.lty = 0)
plot(epcs$date_time,epcs$Global_reactive_power,type = "o",pch =26,xlab = "datetime")
dev.off()