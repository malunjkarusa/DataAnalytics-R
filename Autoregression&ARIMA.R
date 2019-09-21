#Autoregression model

library(zoo)
library(xts)
library(tseries)
library(urca)
library(quantmod)
library(PerformanceAnalytics)

# Column 6th is the Adjusted closing price in Yahoo finance data
AAPL <- getSymbols("AAPL", source = "yahoo", from = "2019-01-01",
                   to = "2019-03-31", auto.assign = FALSE,
                   return.class = "xts") [,6]
plot (AAPL)
#creating time-series for AAPL stock
AAPL <- xts(x=AAPL$AAPL.Adjusted, order.by = index(AAPL))

#AR(1) model on AAPL stock
arima(AAPL, order = c(1,0,0)) # 1 == lags in autoregression

#AR(2) model on AAPL stock
arima(AAPL, order = c(2,0,0))


#AR(3) model on AAPL stock
arima(AAPL, order = c(3,0,0))

