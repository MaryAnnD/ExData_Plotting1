### Plot 3  function and write the plot to the plot3.png file

### Similar for each routine
library(lubridate)
fileUrl<- "household_power_consumption.txt"  
dat <- read.table(fileUrl, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
subSetData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

### Change the Sub_metering data to numbers so that the Plot function can handle it
enm1<- as.numeric(subSetData$Sub_metering_1)
enm2<- as.numeric(subSetData$Sub_metering_2) 
enm3<- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)

{plot(datetime, enm1,pch=".", type="l", col="black",xlab="",ylab="Energy sub metering")
 lines(datetime, enm2,pch=".", type="l", col="red")
 lines(datetime, enm3,pch=".", type="l", col="blue")
 legend ("topright",pch=1, col=c("black","red","blue"),
         legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))
}
dev.off()
