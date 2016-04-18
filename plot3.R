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
newhousehold_power_consumption$Sub_metering_1<- as.numeric(as.character(newhousehold_power_consumption$Sub_metering_1))
newhousehold_power_consumption$Sub_metering_2<- as.numeric(as.character(newhousehold_power_consumption$Sub_metering_2))
newhousehold_power_consumption$Sub_metering_3<- as.numeric(as.character(newhousehold_power_consumption$Sub_metering_3))

newhousehold_power_consumption$x <- paste (Date, Time)
newhousehold_power_consumption$x <- strptime(newhousehold_power_consumption$x, "%Y-%m-%d %H:%M:%S")

with(newhousehold_power_consumption, plot(x, Sub_metering_1, type="l", ylab="Energy sub meeting", xlab = "", col= c("black")))
with(newhousehold_power_consumption, lines(x, Sub_metering_2, type="l", col="red"))
with(newhousehold_power_consumption, lines(x, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!