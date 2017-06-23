df <- read.csv("C:/Users/sleeba/OneDrive/florian_steinke/new_york_energy_monitor/20170610pal.csv", 
               header = T,
               stringsAsFactors = FALSE)
print(colnames(df))
df <- df[, c("Time.Stamp", "Name", "Load" )]
df <-  reshape(df, idvar = "Time.Stamp", timevar = "Name", direction = "wide")
head(df)

################################################
df <- readxl::read_excel("C:/Users/sleeba/OneDrive/florian_steinke/new_york_energy_monitor/final_data.xlsx")

rowSums(MergedData[,c('Test1', 'Test2', 'Test3')], na.rm=TRUE)



################################################

library(ggplot2)
library(scales)


class(df$Time.Stamp)

df$Time.Stamp <- as.POSIXct(df$Time.Stamp,format="%m/%d/%Y %H:%M:%S")

class(df$Time.Stamp)
head(df)

ggplot(data = df, aes(x = Time.Stamp, y = Load.CAPITL)) +
  theme_bw() +
  geom_line(colour = "red", size=1.2 ) +
  ggtitle("Load Consumption Trend in NY - CAPITL")+
  xlab("Time intervels") + ylab("Load Consumption") +
  scale_x_datetime(
    breaks = seq(df$Time.Stamp[1], df$Time.Stamp[length(df$Time.Stamp)], "1 hour"),
    limits = c(
      as.POSIXct("2017-06-10 00:00:00 IST"),
      as.POSIXct("2017-06-10 23:55:00 IST"))) +
  scale_y_continuous(limits = c(0, max(df$Load.CAPITL)))+
  theme(axis.text.x=element_text(angle=90))
