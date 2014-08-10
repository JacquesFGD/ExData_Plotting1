#Imports data and subsets on the wanted dates (need to be in the directory containing data)
setwd("~/R data/exdata-data-household_power_consumption")
data <- read.csv2(file='household_power_consumption.txt',stringsAsFactors = FALSE)
data <- data[(data$'Date' == '1/2/2007'| data$'Date' == '2/2/2007'),]

#Calculates time as a single value
DT <- as.POSIXct(paste(data$'Date', data$'Time', sep = ' '), format='%d/%m/%Y %H:%M:%S')

#Initializes device and options
png(filename = "plot2.png")

#Plots global active power as a function of time
plot(DT, data$'Global_active_power', type='l', xlab='', ylab='Global_active_power')

dev.off()
