source("loadData.R")

#load dataframe
df<-loadData()

#open PNG device
png(filename="Plot2.png", width=480, height=480)
#plot the line graph for date_time and Global_active_power
#setting the labels and selecting a line graph with type
with(df, 
     plot(Date_time, Global_active_power,  
          ylab="Global Active Power (kilowatts)", xlab="",
          type="l"))
#close the device
dev.off()