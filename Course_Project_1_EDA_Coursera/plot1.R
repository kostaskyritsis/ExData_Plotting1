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

# plot1

hist(as.numeric(levels(t2$Global_active_power))[t2$Global_active_power],
     xlab = "Global active power (kilowatts)",
     main = "Global Active Power",
     col = "red");dev.copy(png,"plot1.png");dev.off();dev.off()