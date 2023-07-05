
#common part 

setwd("C:/Users/snoop/OneDrive/Documents/CourseraSpecScienceDonnees/4. Exploratory Data Analysis/week1")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

# Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Orange")

dev.off()
