##Transform data
dataset <- read.table("household_power_consumption.txt", header=T, 
                      sep = ";", stringsAsFactors=F)
set <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
weekdays <- strptime(paste(set$Date, set$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
set$weekdays <- as.POSIXct(weekdays)

##Plot 3.
png("plot3.png", width=480, height=480)
with(set, plot(Sub_metering_1 ~ weekdays, ylab="Energy sub metering", 
               xlab="", type="n"))
with(set, lines(Sub_metering_1 ~ weekdays))
with(set, lines(Sub_metering_2 ~ weekdays, col="red"))
with(set, lines(Sub_metering_3 ~ weekdays, col="blue"))
legend("topright", legend = c(names(set[7:9])), lty=1, 
        col=c("black", "red", "blue"), cex=0.75)
dev.off() 





