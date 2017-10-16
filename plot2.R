epc <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
epcs <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot2.png",width = 480,height = 480,units = "px")
epcs$Global_active_power <- as.numeric(levels(epcs$Global_active_power))[epcs$Global_active_power]
epcs <- unite(epcs,date_time,c(Date,Time),remove = TRUE,sep = " ")
epcs$date_time <- strptime(epcs$date_time, "%Y-%m-%d %H:%M:%S")
plot(epcs$date_time,epcs$Global_active_power,type = "o",pch =26,ylab = "Global Active Power(killowatts)",xlab = "")
dev.off()