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

# plot3

y4 = strptime(paste(t3$Date, t3$Time), 
              format = "%d/%m/%Y %H:%M:%S")

plot( y4, as.numeric(levels(t3$Sub_metering_1))[t3$Sub_metering_1], 
      type = "l", ylab = "Energy sub metering" , xlab = "")
lines( y4, as.numeric(levels(t3$Sub_metering_2))[t3$Sub_metering_2], 
       type = "l",col = "red" )
lines( y4, t3$Sub_metering_3, 
       type = "l", col = "blue" )
legend("topright",legend = colnames(t3)[7:9],
       lty=c(1,1),
       lwd=1,
       col = c("black","red","blue"),
       cex = 0.75)
dev.copy(png,"plot3.png");dev.off();dev.off()