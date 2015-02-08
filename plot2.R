## Coursera Data Science: Exploratory Data Analysis ################################
## Course Project #1

################ Prepare the data ##################################################

# Read the file 
fileurl="household_power_consumption.txt"
power=read.table(fileurl,header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE)

# Clean-up datatypes
power$Date=as.Date(power$Date,"%d/%m/%Y")

# Subset the data for only the dates needed
powersubset=power[power$Date=="2007-02-01" | power$Date=="2007-02-02",]

# Combine Date and Time into datetime
powersubset$datetime=paste(powersubset$Date,powersubset$Time)
powersubset$datetime=strptime(powersubset$datetime, "%Y-%m-%d %H:%M:%S")

# Remove the big dataset
rm(power)

################# Create the plot ################################################
## Plot Global Active Power vs Time

with(powersubset,plot(
    datetime,
    Global_active_power, 
    type="l", 
    ylab="Global Active Power (kilowatts)"
    ))

## Save the graph to a png file
 dev.copy(png,filename="plot2.png", width=480, height=480, units="px")
 dev.off()