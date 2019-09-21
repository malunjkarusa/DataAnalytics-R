#ARIMA - special cases of ARIMA

# White noise model
arima_wn <- arima.sim(model = list(order = c(0,0,0)), n = 100, mean = 0)
arima_wn
ts.plot(arima_wn)

# Random walk
arima_rw <- arima.sim(model = list(order = c(0,1,0)), n = 100, mean = 0)
arima_rw
ts.plot(arima_rw)

# Random walk w/ drift
arima_rwd <- arima.sim(model = list(order = c(0,1,0)), n = 100, mean = 1)
arima_rwd
ts.plot(arima_rwd)

# First order regressive model
arima_fo <- arima.sim(model = list(order = c(1,0,0), ar = 0.75) , 
                      n = 100, mean = 0)
arima_fo
ts.plot(arima_fo)

# Moving average model
arima_ma <- arima.sim(model = list(order = c(0,0,1), ma = 0.6), n = 100, mean = 0)
arima_ma
ts.plot(arima_ma)



