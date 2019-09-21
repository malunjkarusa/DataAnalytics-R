## Module-2 ::  methods of forecastinng
library(fma)

## average as forecast
#Dexcription: the beer data has monthly Aus beer product

head(beer)
summary(beer)

plot(beer)

meanf(beer,1) #mean forecast for 1 forecast period
meanf(beer,5) #mean forecast for 5 forecast periods

#Naive method

naive(beer,1)
naive(beer,5)

rwf(beer,5) ## equivalent random walk

## Linear regression

head(books)
summary(books)
mean(books)

autoplot(books, ylab = "Sales", xlab = "Time", size = 1)
fit <-lm(Paperback ~ Hardcover, data=books) ## Fit a linear reg 
## lm is linear model, Paperback = dependent var, Hardcover = independent var

summary(fit)

plot(Paperback ~ Hardcover, data=books, pch=19)
abline(fit) ## put a regression line on plot



