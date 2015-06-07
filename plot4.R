### Plot 4  function and write the plot to the plot4.png file

### Similar for each routine
fileUrl<- "household_power_consumption.txt"  
dat <- read.table(fileUrl, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
subSetData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

### Get the variables ready to plot. Change each to numeric

gap<- as.numeric(subSetData$Global_active_power)
grp<- as.numeric(subSetData$Global_reactive_power)
enm1<- as.numeric(subSetData$Sub_metering_1)
enm2<- as.numeric(subSetData$Sub_metering_2) 
enm3<- as.numeric(subSetData$Sub_metering_3)
voltg<- as.numeric(subSetData$Voltage)

png("plot4.png", width=480, height=480)

### Ready the diagram for a 2 plots on a row, 2 rows of plots
par(mfrow= c(2,2))
{ 
  plot(datetime,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
  plot(datetime,voltg,type="l",xlab="datetime",ylab="Voltage")
{plot(datetime, enm1,pch=".", type="l", col="blue",xlab="",ylab="Energy sub metering")
 lines(datetime, enm2,pch=".", type="l", col="red")
 lines(datetime, enm3,pch=".", type="l", col="black")
 legend ("topright",pch=1, col=c("blue","red","black"),
         legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))
  }
plot(datetime,grp,type="l",xlab="datetime",ylab="Global Reactive Power")
}
dev.off()
