##Transform data
dataset <- read.table("household_power_consumption.txt", header=T,                           sep = ";", stringsAsFactors=F)
set <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
weekdays <- strptime(paste(set$Date, set$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
set$weekdays <- as.POSIXct(weekdays)

##Plot 2.
png("plot2.png", width=480, height=480)
with(set, plot(Global_active_power ~ weekdays, type="l", 
               xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()



