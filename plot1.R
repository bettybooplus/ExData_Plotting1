##Transform data
dataset <- read.table("household_power_consumption.txt", header=T,                           sep = ";", stringsAsFactors=F)
set <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

##Plot 1. Global Active Power
png("plot1.png", width=480, height=480)
with(set, hist(as.numeric(Global_active_power), col="red", 
       xlab="", main=""))
title(main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
dev.off()


