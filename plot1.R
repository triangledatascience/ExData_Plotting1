####################
#plot 1
####################

filename = "household_power_consumption.txt"
df = read.table(filename, sep=";", header = TRUE)
df$Date = as.Date(strptime(df$Date,format = "%d/%m/%Y"))
df_plot = df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

df_plot$Global_active_power = as.numeric(as.character(df_plot$Global_active_power))

hist(df_plot$Global_active_power
     , col="red"
     , xlab="Global Active Power (kilowatts)"
     , main="Global Active Power")

dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()