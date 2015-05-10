## plot3.R

#Please see plot1.R for subsetting data. For this plot we will read in the data
#in an already subsetted form.
#For details of subsetting see plot1.R.
# Local copy of data to be examined.
filecon <- file("C:\\Users\\Natalie\\Documents\\Data Science Specialization\\R\\Exploratory Data 1\\ExData_Plotting1\\data.txt")

data <- read.table(filecon, header = TRUE, sep = ",", row.names = NULL, stringsAsFactors = FALSE)
lapply(data, class) # Which classes were automatically assigned?

# Convert the columns into date and date-time class
data$Date <- as.Date(data$Date, "%Y-%m-%d")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

with(data, plot(Time, Sub_metering_1, type = "l"))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "-", lwd = 3, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



# Save Plot 3 to file
png(file = "plot3.png",
    width = 480, height = 480) ## Open PNG device; create 'plot3.png' in my working directory
with(data, plot(Time, Sub_metering_1, type = "l",
                ylab = "Energy sub metering",
                xlab = ""))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "-", lwd = 3, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #Draw the graph in the png file
dev.off()  # Close the png device
