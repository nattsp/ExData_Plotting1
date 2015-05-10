# plot2.R

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

with(data, plot(Time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = ""))

# Save Plot 2 to file
png(file = "plot2.png",
    width = 480, height = 480) ## Open PNG device; create 'plot2.png' in my working directory
with(data, plot(Time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = "")) #Draw the graph in the png file
dev.off()  # Close the png device
