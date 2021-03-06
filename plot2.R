data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637 , nrows = 2881)
head <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1)
ndate <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S", tz="UTC")
ndata <- cbind(ndate, data[,3:9])
colnames(ndata)<-c("Date/Time", sapply(head[,3:9], toString))
plot2 <- plot(ndata[,1], ndata[,2], type ="l", xlab = "", ylab = "Active Global Power(kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()