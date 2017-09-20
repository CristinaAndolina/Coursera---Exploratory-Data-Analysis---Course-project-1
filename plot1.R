#-----------------------------------------------
# Exploratory Data Analysis - Course project 1
#-----------------------------------------------

# Loading the data
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                  na.strings = "?", stringsAsFactors = FALSE)

# subsetting dates 2007-02-01 and 2007-02-02
sub_data<-rbind(data[which(data$Date == "1/2/2007"), ], data[which(data$Date == "2/2/2007"), ])
#or
#sub_data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(sub_data$Global_active_power), 
     col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
