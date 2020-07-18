library(dplyr)
library(lubridate)

loadData <- function () {
    if (!file.exists("exdata_data_household_power_consumption.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
            destfile="exdata_data_household_power_consumption.zip")
        
        unzip("exdata_data_household_power_consumption.zip")
    }
    
    df<-read.csv("household_power_consumption.txt",sep=";")
    (df %>% mutate(Date=dmy(Date)) %>% 
            filter(Date>=ymd("20070201") & Date<=ymd("20070202")) %>% 
            mutate(Time=hms(Time), 
                  Global_active_power=as.numeric(Global_active_power), 
                  Global_reactive_power=as.numeric(Global_reactive_power), 
                  Voltage=as.numeric(Voltage), 
                  Global_intensity=as.numeric(Global_intensity), 
                  Sub_metering_1=as.numeric(Sub_metering_1), 
                  Sub_metering_2=as.numeric(Sub_metering_2)) %>% 
            mutate(Date_time=ymd_hm(paste(format(Date,"%Y%m%d")," ",
                                          hour(Time),":",minute(Time),
                                          sep=""))))
}