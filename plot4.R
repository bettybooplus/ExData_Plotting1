##ransform data
dataset <- read.table("household_power_consumption.txt", header=T, 
                      sep = ";", stringsAsFactors=F)
set <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(set$Date, set$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 

##Plot 4.
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar= c(5,4,2,1))

plot(datetime, as.numeric(set$Global_active_power), type="l", 
      ylab="Global Active Power", xlab="")

plot(datetime, set$Voltage, type = "l", ylab="Voltage")

plot(datetime, set$Sub_metering_1, type="l", 
      ylab="Energy sub metering", xlab="")
points(datetime, set$Sub_metering_2, type="l", col="red")
points(datetime, set$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend = c(names(set[7:9])), lty=1, 
        col=c("black", "red", "blue"), cex=0.75)

plot(datetime, set$Global_reactive_power, type="l",
       ylab = names(set[4]))

dev.off()




