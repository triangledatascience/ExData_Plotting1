####################
#plot 3
####################

filename = "household_power_consumption.txt"
df = read.table(filename, sep=";", header = TRUE)
df$Date = as.Date(strptime(df$Date,format = "%d/%m/%Y"))
df_plot = df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

df_plot$Sub_metering_1 = as.numeric(as.character(df_plot$Sub_metering_1))
df_plot$Sub_metering_2 = as.numeric(as.character(df_plot$Sub_metering_2))
df_plot$Sub_metering_3 = as.numeric(as.character(df_plot$Sub_metering_3))

df_plot$DateTime = strptime(paste(df_plot$Date, df_plot$Time, sep=" ")
                            ,format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(df_plot$DateTime
     ,df_plot$Sub_metering_1
     ,xlab=""
     ,ylab="Energy sub metering"
     ,type="l"
     ,col="black"
)

lines(df_plot$DateTime
      ,df_plot$Sub_metering_2
      ,type="l"
      ,col="red")

lines(df_plot$DateTime
      ,df_plot$Sub_metering_3
      ,type="l"
      ,col="blue")

legend(x="topright"
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col=c("black","red","blue")
       , lty=1)

dev.off()