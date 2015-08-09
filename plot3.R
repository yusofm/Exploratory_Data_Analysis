## Reading the data file downloaded and extracted from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

power_cons <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

plot_data <- subset(power_cons, power_cons$Date == "1/2/2007" | power_cons$Date == "2/2/2007")

# Joining Date and Time columns of data
plot_data$Date_Time <- paste(plot_data$Date, plot_data$Time, sep=" ")

# Deleting Date and Time columns as we created new joint column
plot_data <- subset(plot_data, select=c(3:10))

plot_data$Date_Time <- strptime(plot_data$Date_Time, format="%d/%m/%Y %H:%M:%S")

png("Plot3.png", width = 480, heighbt = 480)

plot(plot_data$Date_Time, plot_data$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(plot_data$Date_Time, plot_data$Sub_metering_2, col = "red")
lines(plot_data$Date_Time, plot_data$Sub_metering_3, col = "blue")

legend("topright",lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()