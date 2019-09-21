#ARIMA - on SPY data

#install packages

#install.packages("ggplot2")
#install.packages("tseries")
#install.packages("forecast")
#install.packages("urca")

#Load libraries/packages
library("ggplot2")
library("tseries")
library("forecast")
library("urca")

# download SPY data from yahoo finance and import it as excel
#Pull price column into SPY variable

SPY = (SPY$price) 
head(SPY, n=10)

# Step#1: Plot the data to see if there are any abnormal observations
#Plot the data
plot(SPY, col="darkred", xlab="Time Period", ylab="SPY Price",
     type = "l", lwd = 2, cex = 2, main = "SPY Price series from 2007-2019",
     cex.axis = .8)


# Step#2: Test for stationarity
StationarityTest = ur.df(SPY,type="none", selectlags="AIC")
summary(StationarityTest)

## VIMP -- How to conclude that data is not stationary.
## In summary of stationary test
## "test-stat" value should be less than "tau1" value (critical value)
## in this case 1.58 is not less than -2.58 and thus data is nonstationary


# Step#2a: Make data stationary

D.SPY = diff(SPY, lag = 1, differences = 1)
# plot the graph of first differences
plot(D.SPY, col="darkgreen", xlab="Time period", ylab="D.SPY", type = "l",
     lwd = 2, cex = 2, main = "I(1) - SPY Price series from 2007-2019",
     cex.axis = .8 )
## Stationarity test for first differenes
StationarityTest_Diff = ur.df(D.SPY,type="none", selectlags="AIC")
summary(StationarityTest_Diff)
## we can conclude this data is stationary since "tau1" is -2.58 
#and "test statistic" is -42.83

# Step#3: Examine the pattern for ACF/PACF
ggAcf(D.SPY, lag.max = 10) + theme_bw()
ggPacf(D.SPY, lag.max = 10) + theme_bw()

## VIMP -- we do step 3 to find out how many lags do we need in our model
## since for both ACF and PACF plots, the first 2 lags plots are outside of 
# the significant line (dashed blue line) we need to take at least lag 2. Even
# lag 5 is outside the blue line, so we MAY want to take lag 5.
# Selecting lag is more art than science

# Step#4: Fit the ARIMA model
#Arima(p,d,q)
# ??? Auto regressive - AR (p)  // p is the order (lag) of the autoregressive part
# ??? Integrated - I(d) // degree of differencing
# ??? Moving average - MA(q) // q is the order (lag) of the moving average
#
ARIMA1 <- Arima(D.SPY, order = c(1,0,1))
ARIMA2 <- Arima(D.SPY, order = c(1,0,2))
ARIMA3 <- Arima(D.SPY, order = c(2,0,1))
ARIMA4 <- Arima(D.SPY, order = c(2,0,2))
#summarize models
Summary(ARIMA1)
Summary(ARIMA2)
Summary(ARIMA3)
Summary(ARIMA4)

## look for the model with lowest RMSE to evalauate a model

# R function that auto-ARIMA that select the right ARIMA function/model
# by looking at AIC/BIC values

# Building ARIMA forecasting graph, find the best-fitted ARIMA model

Fitted.Arima = auto.arima(SPY)
#plot forecasted ARIMA with the last 50 days
q = forecast(Fitted.Arima, h = 10) 
# h=10 means I want to forecast SPY prices for next 10 days

summary(q)
plot(q, include = 50) ## 50 indicates include last 50 days of SPY prices
