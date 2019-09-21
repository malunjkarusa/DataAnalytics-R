##simple moving averages

library(forecast)
library(ggplot2)
library(ggfortify)

head(gold)

# the dim command allows you to check the size of dataset
# the first value indicates the no. of rows
# the secone value indicates no. of columns
str(gold)
dim(gold)

# next we create gold time series
goldts <- ts(gold[,2])
autoplot(goldts)

## adding labels to the chart

autoplot(goldts) + ggtitle("Daily gold prices") + 
  xlab ("period: Jan 1, 1968 to June 11, 2019") +
  ylab("USD")

#the moving average command is ma(x,order) where x is data and order = lag

goldts10lags <-ma(goldts,10)
autoplot(goldts10lags) + ggtitle("Gold prices: Moving average 10 days") + 
  xlab ("period: Jan 1, 1968 to June 11, 2019") +
  ylab("USD")


goldts100lags <-ma(goldts,100)
autoplot(goldts100lags) + ggtitle("Gold prices: Moving average 100 days") + 
  xlab ("period: Jan 1, 1968 to June 11, 2019") +
  ylab("USD")

goldts500lags <-ma(goldts,500)
autoplot(goldts500lags) + ggtitle("Gold prices: Moving average 500 days") + 
  xlab ("period: Jan 1, 1968 to June 11, 2019") +
  ylab("USD")