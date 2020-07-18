source("loadData.R")

#load the dataframe
df<-loadData()

#open the PNG device
png(filename="Plot4.png", width=480, height=480)
#initalize the canvas as 2x2 grid
par(mfrow=c(2,2))


#plot top left
with(df, 
     plot(Date_time, Global_active_power,  
          ylab="Global Active Power (kilowatts)", xlab="",
          type="l"))

#plot top right
with(df, plot(Date_time, Voltage, type="l", xlab="datetime"))

#plot bottom left
with(df, plot(Date_time, Sub_metering_1, type="n", 
              ylab="Energy sub metering", xlab="",
              ylim=c(0,38)))
with(df, lines(df$Date_time, df$Sub_metering_1))
with(df, lines(df$Date_time, df$Sub_metering_2, col="red"))
with(df, lines(df$Date_time, df$Sub_metering_3, col="blue"))
legend("topright",lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot bottom right
with(df, plot(Date_time, Global_reactive_power, type="l", xlab="datetime"))

#close device
dev.off()
