## Differncing
library(zoo)
library(xts)
library(timeSeries)
library(urca)
AAPL <- getSymbols("AAPL", source = "yahoo", from = "2019-01-01",
                  to = "2019-03-31", auto.assign = FALSE, return.class = "xts")[,6]

#Creating time-series for AAPL stock

AAPL <- xts(x=AAPL$AAPL.adjusted, order.by = index(AAPL))

#Stationarity testing
adf = adf.test(AAPL)
print(adf)

#stationarity testing on first differences

AAPL.diff = diff(AAPL)

AAPL.diff = na.omit(AAPL.diff) ## omits "N/A"

diff.adf = adf.test(AAPL.diff)

#plot the data

par(mfrow = c(2,1), mar=c(3,4,4,2)) # Code to put both graphs in one window
plot(AAPL, col = "darkblue", ylab="Price")
plot(AAPL.diff, col = "darkblue", ylab = "Price")
