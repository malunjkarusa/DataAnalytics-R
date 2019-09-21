## exponential smoothing example
library(fma)
library(forecast)

# load TS data: beer
data(beer)
beer
autoplot(beer)

#simple exponential smoothing using alpha at 0.1, 0.5 and 0.9
# find which one has lowest RMSE

beer1<- ses(beer,h=25,level = c(80,95), alpha = .1)
## h is lag, level is confidence interval
summary(beer1)
autoplot(beer1)
beer2<- ses(beer,h=25,level = c(80,95), alpha = .5)
summary(beer2)
autoplot(beer2)
beer3<- ses(beer,h=25,level = c(80,95), alpha = .9)
summary(beer3)
autoplot(beer3)