
#common part 

setwd("C:/Users/snoop/OneDrive/Documents/CourseraSpecScienceDonnees/4. Exploratory Data Analysis/week1")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

dta <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

dta[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

dta[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

dta <- dta[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

# Plot 1
hist(dta[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Orange")

dev.off()
