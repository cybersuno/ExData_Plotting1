source("loadData.R")

#load the data frame prepared
df<-loadData()

#open PNG device
png(filename="Plot1.png", width=480, height=480)
#plot the histogram
with(df, hist(Global_active_power, col="red", 
              xlab="Global Active Power (kilowatts)",
              main="Global Active Power"))
#close PNG device
dev.off()