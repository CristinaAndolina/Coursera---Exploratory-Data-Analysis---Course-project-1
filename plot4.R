#-----------------------------------------------
# Exploratory Data Analysis - Course project 1
#-----------------------------------------------

## Loading the data
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", stringsAsFactors = FALSE)

## subsetting dates 2007-02-01 and 2007-02-02
sub_data<-rbind(data[which(data$Date == "1/2/2007"), ], data[which(data$Date == "2/2/2007"), ])
#or
#sub_data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



## Plot4 ##
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# plot1
plot(date_time, as.numeric(sub_data$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power")

# plot2
plot(date_time, as.numeric(sub_data$Voltage), 
     type="l", ylab="Voltage", xlab = "datetime")

# plot3
plot(date_time, as.numeric(sub_data$Sub_metering_1), 
     type="l", xlab="", col = "black",
     ylab="Energy sub metering")
points(date_time, as.numeric(sub_data$Sub_metering_2), 
       type="l", xlab="", col = "red")
points(date_time, as.numeric(sub_data$Sub_metering_3), 
       type="l", xlab="", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black","red","blue"), bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# plot4
plot(date_time, as.numeric(sub_data$Global_reactive_power), 
     type="l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()

