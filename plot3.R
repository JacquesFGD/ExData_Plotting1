#Imports data and subsets on the wanted dates (need to be in the directory containing data)
setwd("~/R data/exdata-data-household_power_consumption")
data <- read.csv2(file='household_power_consumption.txt',stringsAsFactors = FALSE)
data <- data[(data$'Date' == '1/2/2007'| data$'Date' == '2/2/2007'),]

#Calculates time as a single value
DT <- as.POSIXct(paste(data$'Date', data$'Time', sep = ' '), format='%d/%m/%Y %H:%M:%S')

#Initializes device and options
png(filename = "plot3.png")

#Plots energy per sub metering
plot(DT, data$'Sub_metering_1', type='l', xlab='', ylab='Energy sub metering')
lines(DT, data$'Sub_metering_2', col = 'red')
lines(DT, data$'Sub_metering_3', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black','red','blue'), lty=c(1,1,1))

dev.off()