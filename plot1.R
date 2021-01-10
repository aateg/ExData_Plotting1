library(lubridate)

# load data set
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# cleaning and casting data
df$Date <- lubridate::dmy(df$Date) # cast as date
df2 <- subset(df, df$Date >= '2007-02-01' & df$Date <= '2007-02-02') # subset
rm(df) # remove df

#df2$Time <- hms(df2$Time) # cast as time
df2$Global_active_power <- as.numeric(df2$Global_active_power)

# plot data
png(file = 'plot1.png')
hist(
  df2$Global_active_power, 
  col = 'red', 
  main = 'Global Active Power', 
  xlab = 'Global Active Power (kilowatts)')
dev.off()

