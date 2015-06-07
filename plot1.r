### Plot 1  function and write the plot to the plot1.png file

### Similar for each routine
fileUrl<- "household_power_consumption.txt"  
dat <- read.table(fileUrl, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
subSetData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

### Change the Global_active_power to numbers so the Plot function can handle it
gap<- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(gap,main="Global Active Power",ylim=c(0,1200),breaks=6, 
     col="red",xlab="Global Active Power (kilowatts)",ylab="")

dev.off()