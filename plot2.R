library(lubridate)

# load data set
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# cleaning and casting data
df$DateTime <- lubridate::dmy_hms(paste(df$Date, df$Time))
df$Date <- lubridate::dmy(df$Date)
df2 <- subset(df, df$Date >= '2007-02-01' & df$Date <= '2007-02-02') # subset
rm(df) # remove df

df2$Global_active_power <- as.numeric(df2$Global_active_power)

# plot
png(file = 'plot2.png')
plot(
  x = df2$DateTime, 
  y = df2$Global_active_power, 
  type = 'l',
  xlab = '',
  ylab = 'Global Active Power (kilowatts)')
dev.off()
