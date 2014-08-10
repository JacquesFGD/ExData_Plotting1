#Imports data and subsets on the wanted dates (need to be in the directory containing data)
setwd("~/R data/exdata-data-household_power_consumption")
data <- read.csv2(file='household_power_consumption.txt',stringsAsFactors = FALSE)
data <- data[(data$'Date' == '1/2/2007'| data$'Date' == '2/2/2007'),]

#Initializes device and options
png(filename = "plot4.png")
par(mar=c(4,4,1,1),mfcol=c(2,2))

#Calculates time as a single value
DT <- as.POSIXct(paste(data$'Date', data$'Time', sep = ' '), format='%d/%m/%Y %H:%M:%S')

#Plots global active power as a function of time
plot(DT, data$'Global_active_power', type='l', xlab='', ylab='Global_active_power')

#Plots energy per sub metering
plot(DT, data$'Sub_metering_1', type='l', xlab='', ylab='Energy sub metering')
lines(DT, data$'Sub_metering_2', col = 'red')
lines(DT, data$'Sub_metering_3', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black','red','blue'), lty=c(1,1,1), bty='n')

#Plots voltage then global reactive power
plot(DT, data$'Voltage', type='l', xlab='Datetime', ylab='Voltage')
plot(DT, data$'Global_reactive_power', type='l', xlab='Datetime', ylab='Global_reactive_power')

dev.off()