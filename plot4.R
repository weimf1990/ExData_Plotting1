#plot 4
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

#formatting date / time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440, "Time"] <- format(data[1:1440, "Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

###################################################################
#plot 4
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(data, {
  plot(data$Time, Global_active_power, type="l", xlab="", 
                ylab="Global Active Power")
  
  plot(data$Time, Voltage, type="l", xlab="datetime",
                ylab = "Voltage")
  
  with(data, plot(data$Time, Sub_metering_1, type="l", xlab="", 
                  ylab="Energy sub metering"))
    lines(Time, Sub_metering_2, type="l", col= "red")
    lines(Time, Sub_metering_3, type="l", col= "blue")
    legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty= 1, lwd=2, col = c("black", "red", "blue"))

  plot(data$Time, Global_reactive_power, type="l", xlab="datetime", 
                  ylab="Global_reactive_power")
  }
)

dev.off()