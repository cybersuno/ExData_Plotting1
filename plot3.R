source("loadData.R")

#load the data.frame
df<-loadData()

#open PNG device
png(filename="Plot3.png", width=480, height=480)
#plot the base plot, with no graphics (type n)
with(df, plot(Date_time, Sub_metering_1, type="n", 
              ylab="Energy sub metering", xlab="",
              ylim=c(0,38)))
#add the sub_Metering_1, 2 and 3 lines
with(df, lines(df$Date_time, df$Sub_metering_1))
with(df, lines(df$Date_time, df$Sub_metering_2, col="red"))
with(df, lines(df$Date_time, df$Sub_metering_3, col="blue"))
#add legend
legend("topright",lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close device
dev.off()