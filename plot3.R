library(lubridate)

# load data set
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# cleaning and casting data
df$DateTime <- lubridate::dmy_hms(paste(df$Date, df$Time))
df$Date <- lubridate::dmy(df$Date)
df2 <- subset(df, df$Date >= '2007-02-01' & df$Date <= '2007-02-02') # subset
rm(df) # remove df

df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

# plot
makePlot <- function() {
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
    legend = c(
      'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    col = c('black', 'red', 'blue'),
    lty = c(1, 1, 1), lwd = 2
  )
}
# save plot
png(file = 'plot3.png')
makePlot()
dev.off()
