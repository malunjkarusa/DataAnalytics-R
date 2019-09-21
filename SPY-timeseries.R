library(forecast)
library(fma)

#example SPY closing prices , create a SPY vector

spy<- c(286.51,285.63,282.14,282.78,280.15)

spy

spy.timeseries <-ts(c(286.51,285.63,282.14,282.78,280.15))

spy.timeseries

#following command creates a plot
#autoplot is specfically designed for time series data

plot(spy.timeseries)
autoplot(spy.timeseries)

#preinstalled R data on coal production

head(bicoal)
head(bicoal,10)
autoplot(bicoal)
