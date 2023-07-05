#common part 

setwd("C:/Users/snoop/OneDrive/Documents/CourseraSpecScienceDonnees/4. Exploratory Data Analysis/week1")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

dta <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")

dta[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
dta[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

dta <- dta[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

#plot3
plot(dta[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dta[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(dta[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
