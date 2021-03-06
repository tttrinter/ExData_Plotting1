## Coursera Data Science: Exploratory Data Analysis ################################
## Course Project #1
## Plot 3

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

################# Create the 4 plot matrix ################################################
par(mfrow=c(2,2))

# Plot (1,1) - Global Active Power vs Time
    with(powersubset, plot(
        datetime,
        Global_active_power, 
        type="l", 
        ylab="Global Active Power (kilowatts)"
        ))

# Plot (1,2) - Voltage vs Time
    with(powersubset,plot(
        datetime,
        Voltage, 
        type="l", 
        ylab="Voltage"
    ))

# plot (2,1) - Energy sub metering
    with(powersubset,plot(datetime,Sub_metering_1, type="l", col="black", ylab="Energy sub metering"))

    # Add sub_meter 2
        with(powersubset,points(datetime, Sub_metering_2,col="red", type="l"))
    
    # Add sub_meter 3
        with(powersubset,points(datetime, Sub_metering_3,col="blue", type="l"))
    
    # Add the legend
        legend("topright", 
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
            col=c("black","red","blue"), 
            lty=1,
            cex=.5, 
            y.intersp=.75)


# Plot (2,2) - Global_reactive_power vs Time
    with(powersubset, plot(
        datetime,
        Global_reactive_power, 
        type="l", 
        ylab="Global reactive power")
    )

## Save the graph to a png file
 dev.copy(png,filename="plot4.png", width=480, height=480, units="px")
 dev.off()