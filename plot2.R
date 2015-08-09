## Reading the data file downloaded and extracted from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

power_cons <- read.table(".b/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

plot_data <- subset(power_cons, power_cons$Date == "1/2/2007" | power_cons$Date == "2/2/2007")

# Joining Date and Time columns of data
plot_data$Date_Time <- paste(plot_data$Date, plot_data$Time, sep=" ")

# Deleting Date and Time columns as we created new joint column
plot_data <- subset(plot_data, select=c(3:10))

plot_data$Date_Time <- strptime(plot_data$Date_Time, format="%d/%m/%Y %H:%M:%S")

png("Plot2.png", width = 480, height = 480)

plot(plot_data$Date_Time, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()