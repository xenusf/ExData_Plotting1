## Load package sqldf, to enable reading data only for specified dates
library(sqldf)

## read to dataframe "power" from text file in working directory, filtered on specified dates
power <- read.csv2.sql("household_power_consumption.txt", sql = "select * from file 
                       where Date in ('1/2/2007', '2/2/2007')")

## capture working directory, set WD to repository folder
wd <- getwd()
setwd("ExData_Plotting1")

## Open png device, set filename & image dimensions
png(file = "plot3.png", width = 480, height = 480)

## initialize plot, plot date/time against sub_metering_1, without points
plot.new()
with(power, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), 
                   Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))

## add lines for each sub_metering category, in different line colors
with(power, lines(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, col="black"))
with(power, lines(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col="red"))
with(power, lines(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col="blue"))

## add legend for the different categories
legend("topright", col=c("black","red","blue"), lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close png device
dev.off()

#return to original working directory
setwd(wd)


