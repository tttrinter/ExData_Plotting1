## Coursera Data Science: Exploratory Data Analysis
## Course Project #1

################ Prepare the data ##############################

# Read the file 
fileurl="household_power_consumption.txt"
power=read.table(fileurl,header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE)

# Clean-up datatypes
power$Date=as.Date(power$Date,"%d/%m/%Y")
power$Time=strptime(power$Time,"%H:%M:%S")

# Subset the data for only the dates needed
powerDates=power[power$Date=="2007-02-01" | power$Date=="2007-02-02",]

# Remove the big dataset
rm(power)

hist(powerDates$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)")