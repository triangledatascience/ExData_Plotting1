####################
#plot 2
####################

filename = "household_power_consumption.txt"
df = read.table(filename, sep=";", header = TRUE)
df$Date = as.Date(strptime(df$Date,format = "%d/%m/%Y"))
df_plot = df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

df_plot$Global_active_power = as.numeric(as.character(df_plot$Global_active_power))

df_plot$DateTime = strptime(paste(df_plot$Date, df_plot$Time, sep=" ")
                            ,format = "%Y-%m-%d %H:%M:%S")

plot(df_plot$DateTime
     ,df_plot$Global_active_power
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,type="l"
)

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()