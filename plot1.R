#Imports data and subsets on the wanted dates (need to be in the directory containing data)
setwd("~/R data/exdata-data-household_power_consumption")
data <- read.csv2(file='household_power_consumption.txt',stringsAsFactors = FALSE)
data <- data[(data$'Date' == '1/2/2007'| data$'Date' == '2/2/2007'),]

#Initializes device and options
png(filename = "plot1.png")

#Generates histogram for global active power
hist(as.numeric(data$'Global_active_power'), col='red', main='Global Active Power', 
     xlab = "Global Active Power (kilowatts)")

dev.off()