#read data
household_power_consumption <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE , sep=";")
names(household_power_consumption)

#format the dates / time
class(household_power_consumption$Date)
as.Date(household_power_consumption$Date, format="%d/%m/%Y")
strptime(household_power_consumption$Time, format = "%H:%M:%S")

data <- subset(household_power_consumption, Date == "1/2/2007" | Date =="2/2/2007")  
##type the date format based on the ones in the dataset

#formatting all the variables
Global_active_power <- as.numeric(data$Global_active_power)
Global_reactive_power <- as.numeric(data$Global_reactive_power)
Voltage <- as.numeric(data$Voltage)
Global_intensity <- as.numeric(data$Global_intensity)
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
Date <- as.Date(data$Date, format="%d/%m/%Y")
Time <- strptime(data$Time, format = "%H:%M:%S")

###################################################################
##Construct the plot and save it to a PNG file.
###with a width of 480 pixels and a height of 480 pixels.

#plot 1
hist(Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global active power (kilowatts)")

png(filename = "plot1.png", width = 480, height = 480)
