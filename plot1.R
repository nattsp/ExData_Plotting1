## plot1.R

library("strptime")  ## time manipulation
filecon <- file("C:\\Users\\Natalie\\Documents\\Data Science Specialization\\R\\Exploratory Data 1\\ExData_Plotting1\\household_power_consumption.txt")

dataAll <- read.csv2(filecon, dec = ".", na.strings = "?")
lapply(dataAll, class)
#data$Date <- strptime(data$Date, "%d/%m/%Y")
dataAll$Date <- as.Date(dataAll$Date, "%d/%m/%Y")
dataAll$Time <- strptime(paste(dataAll$Date, dataAll$Time), "%Y-%m-%d %H:%M:%S")


data <- dataAll[(dataAll$Date == "2007-02-01" | dataAll$Date == "2007-02-02"), ]



