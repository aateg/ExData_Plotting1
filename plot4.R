library(lubridate)

# load data set
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# cleaning and casting data
df$DateTime <- lubridate::dmy_hms(paste(df$Date, df$Time))
df$Date <- lubridate::dmy(df$Date)
df2 <- subset(df, df$Date >= '2007-02-01' & df$Date <= '2007-02-02') # subset
rm(df) # remove df

df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)
df2$Voltage <- as.numeric(df2$Voltage)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)

# plots
plot1 <- function() {
  plot(
    x = df2$DateTime, y = df2$Global_active_power, type = 'l',
    xlab = '', ylab = 'Global Active Power (kilowatts)')
}
plot2 <- function() {
  plot(
    x = df2$DateTime, y = df2$Voltage, type = 'l',
    xlab = 'datetime', ylab = 'Voltage')
}
plot3 <- function() {
  text =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  plot(
    x = df2$DateTime, y = df2$Sub_metering_1, 
    col = 'black', type = 'l',
    xlab = '', ylab = 'Energy sub metering')
  lines(
    x = df2$DateTime, y = df2$Sub_metering_2, 
    col = 'red', type = 'l',
    xlab = '', ylab = 'Energy sub metering')
  lines(
    x = df2$DateTime, y = df2$Sub_metering_3, 
    col = 'blue', type = 'l',
    xlab = '', ylab = 'Energy sub metering')
  legend(
    'topright',
    legend = text,
    col = c('black', 'red', 'blue'),
    lty = 1, cex = 0.6
  )
}
plot4 <- function() {
  plot(
    x = df2$DateTime, y = df2$Global_reactive_power, type = 'l',
    xlab = 'datetime', ylab = 'Global_reactive_power')
}

# save plot
png(file = 'plot4.png')
par(mfrow=c(2,2))
plot1()
plot2()
plot3()
plot4()
dev.off()



