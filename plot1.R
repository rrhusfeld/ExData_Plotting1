household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")
class(household_power_consumption$Date)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
class(household_power_consumption$Date)
format(household_power_consumption$Date, format="%Y-%m-%d")
##startdate is 2007-02-01 and enddate is 2007*02-02
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")
##Subset the data from start date to end date and store in new variable called "newhousehold_power_consumption"
newhousehold_power_consumption <- household_power_consumption[which(household_power_consumption$Date >= startdate & household_power_consumption$Date <= enddate),]
##convert the Global acitve power from factor to numeric varabile
newhousehold_power_consumption$Global_active_power <- as.numeric(as.character(newhousehold_power_consumption$Global_active_power))
hist(newhousehold_power_consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
