## Trading Algo -- trend following strategy
library(quantmod)
installed.packages("tidyverse")
library(tidyverse)
library(TTR)

## get stock price data for AAP Inc 

AAP <- getSymbols("AAP", source = "yahoo", auto.assign =  FALSE,
                  return.class = "xts")[,6] ## only use the 6th column i.e. closing price

#calculate returns
AAPret <-diff(log(AAP))
colnames(AAPret) <-"AAP"

#Trim the dataset
AAPret <- AAPret["2010/"]
AAP <- AAP["2010/"]
plot(AAP)


#Generate simple moving averages
sma26 <-SMA(AAP,26)
sma12 <-SMA(AAP,12)

Data <- na.omit(as.data.frame(cbind(AAP,AAPret, sma12,sma26))) 
## cbind is column bind function
## na.omit function will get rid of N/A values

colnames(Data) <- c("AAPPrices", "AAPRet", "SMA12", "SMA26")

# Condition for trend following strategy
## if SMA12 is more than or equal to SMA26 values in data frame
## then set UD column value to 1(Buy), else set it to 0 (Sell)
Data$UD <- ifelse(Data$SMA12 >= Data$SMA26, 1, 0)

#Devise a trading strategy and backtest
Data$Trade <- ifelse(Data$UD == 1, "BUY", "SELL")
Data$Position <- ifelse(Data$Trade == "BUY", 1, -1)
Data$AlgoRet <- Data$AAPRet * Data$Position
AnnualizedReturn <- ((mean(Data$AlgoRet)+1)^252-1)
plot(AAPret)

Standev <- sd(Data$AlgoRet) ## Standard deviation 
rf <- 0.02 ## assuming risk free rate of 2%
SharpeRatio <- (AnnualizedReturn - rf)/Standev

#Print the results
print(paste("The trend-following algo was applied to AAP stock to get annualized return of",AnnualizedReturn))


# plot the data
plot(Data$AAPPrices, type="l", col="red", xlab="Prices")
par(new = TRUE)
plot(Data$SMA12, type="l", col="green")
par(new = TRUE)
plot(Data$SMA26, type="l", col="blue")

      
