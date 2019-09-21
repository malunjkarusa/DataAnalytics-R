##Holt-Winters method and simple exponential smooothing example

library(forecast)
library(fma)
library(datasets)
library(ggplot2)

## Simple exponential smoothing
airpass
autoplot(airpass)

## simple exponential smoothing - ses################################
ses5 <- ses(airpass, h=5) ## 5 lags
ses5
accuracy(ses5)
autoplot(ses5) + autolayer(fitted(ses5), series = "Fitted")

ses25 <- ses(airpass, h=25) ## 25 lags
ses25
accuracy(ses25)
autoplot(ses25) + autolayer(fitted(ses25), series = "Fitted")

## Holt's linear trend method###########################################

holt5 <- holt(airpass, h=5)
autoplot(holt5) + autolayer(fitted(holt5), series = "Fitted")

holt5damped <- holt(airpass, damped = TRUE, phi = 0.9, h=15)
# phi?? , h is the lag interval


#Evidence suggested that the Holt's linear trend method overestimated 
# the predicted values, Gardner and Mckenzie found that dampening the trend
#helped accuracy

autoplot(airpass) + 
  autolayer(holt5, series = "Holt's method", PI=FALSE) + 
  autolayer(holt5damped, series = "Damped Holt's method", PI=FALSE) + 
  ggtitle("Forecasts from Holt's method") + 
  guides (colour = guide_legend(title="Forecast"))

## Holt's seasonal trend method ###########################################

hw1 <- hw(airpass, seasonal = "additive")
hw2 <- hw(airpass, seasonal = "multiplicative")

autoplot(airpass) + 
  autolayer(hw1, series = "HW Additive forecasts", PI=FALSE) + 
  autolayer(hw2, series = "HW multiplicative forecasts", PI=FALSE) + 
  #ggtitle("Forecasts from Holt's method") + 
  guides (colour = guide_legend(title="Forecast"))

