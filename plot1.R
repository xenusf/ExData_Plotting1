## Load package sqldf, to enable reading data only for specified dates
library(sqldf)

## read to dataframe "power" from text file in working directory, filtered on specified dates
power <- read.csv2.sql("household_power_consumption.txt", sql = "select * from file 
                       where Date in ('1/2/2007', '2/2/2007')")

## capture working directory, set WD to repository folder
wd <- getwd()
setwd("ExData_Plotting1")


## Open png device, set filename & image dimensions
png(file = "plot1.png", width = 480, height = 480)

## Histogram - Global Active Power
hist(power$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power")

#Close png device
dev.off()

#return to original working directory
setwd(wd)

