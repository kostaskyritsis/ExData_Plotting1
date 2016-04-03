# read file with data
t1 = read.table(header = TRUE,
                "household_power_consumption.txt",
                sep = ";")

# convert Date character strings to date objects
ind_dates = as.Date(t1$Date, format = "%d/%m/%Y")

# index for dates 2007-02-01 and 2007-02-02
t2=t1[ind_dates%in%as.Date(c("2007-02-01","2007-02-02"),
                           format = "%Y-%m-%d"),]

# index for dates 2007-02-01, 2007-02-02 and 2007-02-03
t3=t1[ind_dates%in%as.Date(c("2007-02-01","2007-02-02","2007-02-03"),
                           format = "%Y-%m-%d"),]

# keeping only the first measurement of 2007-02-03 in order to add "Sat" in the x axis of the plots
t3 = t3[1:min(which(t3$Date == "3/2/2007")),]

rm(t1)
rm(ind_dates)

# plot4

par(mfrow=c(2,2))

#1

plot(y4,as.numeric(levels(t3$Global_active_power))[t3$Global_active_power],
     type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "")

#2

plot(y4,as.numeric(levels(t3$Voltage))[t3$Voltage],
     type = "l", ylab = "Voltage", 
     xlab = "datatime")

#3

plot( y4, as.numeric(levels(t3$Sub_metering_1))[t3$Sub_metering_1], 
      type = "l", ylab = "Energy sub metering" , xlab = "")
lines( y4, as.numeric(levels(t3$Sub_metering_2))[t3$Sub_metering_2], 
       type = "l",col = "red" )
lines( y4, t3$Sub_metering_3, 
       type = "l", col = "blue" )
legend(x = 3,y = 25,legend = colnames(t3)[7:9],
       lty=c(1,1),
       lwd=1,
       col = c("black","red","blue"),
       bty = "n")

#4 
plot(y4,as.numeric(levels(t3$Global_reactive_power))[t3$Global_reactive_power],
     type = "l", ylab = "Global_reactive_power (kilowatts)", 
     xlab = "datatime")

dev.copy(png,"plot4.png");dev.off();dev.off()