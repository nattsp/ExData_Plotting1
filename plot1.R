## plot1.R

# Local copy of data to be examined.
filecon <- file("C:\\Users\\Natalie\\Documents\\Data Science Specialization\\R\\Exploratory Data 1\\ExData_Plotting1\\household_power_consumption.txt")

#Read file into R
dataAll <- read.csv2(filecon, dec = ".", na.strings = "?")
lapply(dataAll, class) # Which classes were automatically assigned?

#Convert years to a date
dataAll$Date <- as.Date(dataAll$Date, "%d/%m/%Y")
# Put date and time together for timeseries graphing.
dataAll$Time <- strptime(paste(dataAll$Date, dataAll$Time), "%Y-%m-%d %H:%M:%S")
# Subset data to the two days in question in the assignment.
data <- dataAll[(dataAll$Date == "2007-02-01" | dataAll$Date == "2007-02-02"), ]

#Save this subsetted data for later exploratory graphs
write.table(data, file = "data.txt", row.name=FALSE)



# Plot 1 Check the graph on the screen
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save Plot 1 to file
png(file = "plot1.png",
    width = 480, height = 480) ## Open PNG device; create 'plot1.png' in my working directory
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)") #Draw the graph in the png file
dev.off()  # Close the png device
