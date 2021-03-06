## Coursera Data Science: Exploratory Data Analysis ################################
## Course Project #1

################ Prepare the data ##################################################

# Read the file 
fileurl="household_power_consumption.txt"
power=read.table(fileurl,header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE)

# Clean-up datatypes
power$Date=as.Date(power$Date,"%d/%m/%Y")
power$Time=strptime(power$Time,"%H:%M:%S")

# Subset the data for only the dates needed
powersubset=power[power$Date=="2007-02-01" | power$Date=="2007-02-02",]

# Remove the big dataset
rm(power)

################# Create the plot ################################################
hist(powersubset$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)",
     )

## Save the graph to a png file
dev.copy(png,filename="plot1.png", width=480, height=480, units="px")
dev.off()