### Plot 2  function and write the plot to the plot2.png file

### Similar for each routine
library(lubridate)
fileUrl<- "household_power_consumption.txt"  
dat <- read.table(fileUrl, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
subSetData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

### Change the Global_active_power to numbers so the Plot function can handle it
gap<- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)") 

dev.off()