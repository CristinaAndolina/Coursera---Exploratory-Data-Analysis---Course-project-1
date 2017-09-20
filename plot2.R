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



## Plot2 ##

# Converting Date and Time variables to Date/Time class
date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Adjusting weekdays to English language
curr_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","en_US.UTF-8")
Sys.setlocale("LC_TIME",curr_locale)

# Setting the device and plot
png("plot2.png", width=480, height=480)
plot(date_time, as.numeric(sub_data$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



