
#############################################################
#
# Financial Analytics Assignment 3.
#
# In this assignment, you are asked to use some of the 
# commands demonstrated in the video examples to create a portfolio.
# You will then be asked to interpret the # results.  
#
# For this assignment, you may use any resources necessary
# to be able to exectute the code.  However, the interpretation 
# should reflect your own thinking.
#
# You are to work on the problem alone, without help 
# from any other person.
#
# In this assignment, you will create a portfolio with only two
# stocks.  Use the sample code for reference.
###############################################################

# INSTRUCTIONS:  Enter your code between the comments line 
# as directed.  Comments begin with a hashtag '#'.

# For example

### Start Code

### End Code

# If you are asked to interpret results, make sure to put your
# answers in a comment line.

################################################################ 

###  required libraries  ###
# Run the following code to load the packages (libraries)
# If the library package does not load properly, make sure 
# that you have installed the package onto  your system.  
# Use the 'Packages' tab in RStudio to install the package.

library(fPortfolio)
library(quantmod)
library(ggplot2)
library(BatchGetSymbols)
library(timeSeries)


#Select two stocks from the S&P 500 and get their ticker symbol from the yahoo finance.
# You may NOT choose Apple, Intel, or any other of the symbols used in the example code.
#####################################################
# QUESTION 1: Write down the stock symbols here.

# Stock 1 is: Alliance Data Systems [ADS]
# Stock 2 is: Amazon.com Inc [AMZN]

#* End Question 1
######################################################

#* In this solution, I use XXXX and YYYY as the two ticker symbols.  The students should
#* update the code appropriately. That is, they should substitute XXXX with the ticker symbol
#* that they selected.

######################################################
# Question 2: Modify the next line of code.
stocks1 <- c("ADS", "AMZN")

#######################################################
#Run the following code
prices1 <- getSymbols(stocks1[1], source="yahoo", auto.assign=FALSE,
                      return.class="xts")[,6]
prices2 <- getSymbols(stocks1[2], source="yahoo", auto.assign=FALSE,
                      return.class="xts")[,6]

prices <- cbind(prices1, prices2)

colnames(prices) <- stocks1
# End of Code to Run
########################################################
#QUESTION 3: Plot the first stock

plot(prices$ADS)

#QUESTION 4: Plot the second stock
plot(prices$AMZN)

# End Question 3 and 4
#########################################################

#######################################################
#Run the following code

#Since we will be working with returns, let us convert the price data to returns 

Portfolio1 <- na.omit(diff(log(prices)))

#Trimming the Data to get recent data post 12-31-2014
Portfolio1 <- Portfolio1["2015/"]

# End of Code to Run
########################################################


########################################################
### QUESTION 5: Update the following code with your stocks to get
#* the means and variances.
mean(Portfolio1$ADS)
var(Portfolio1$ADS)
mean(Portfolio1$AMZN)|
  var(Portfolio1$AMZN)

means <- c(mean(Portfolio1$ADS),mean(Portfolio1$AMZN))
vars <- c(var(Portfolio1$ADS),var(Portfolio1$AMZN))

### End code  update
########################################################

#######################################################
#Run the following code
Stockplot <- as.data.frame(t(cbind(vars, means)))
colnames(Stockplot)<- stocks1
Stockplot <- t(Stockplot)

plot(Stockplot, col = heat.colors(5), pch= 15, xlab = "Variance", ylab = "Mean Returns", main = "Risk vs Return")
legend("topright", legend=stocks1,
       col=heat.colors(5), lty=1:2, cex=0.8, pch = 15)

#Convert the numeric vectors to timeseries vectors

Portfolio1 <- as.timeSeries(Portfolio1)

#Let us build portfolio using each of the stock combinations to obtain the minimum variance portfolio 
#in each of the cases


#Set Specs

Spec = portfolioSpec()
setNFrontierPoints(Spec)<-100


##Determine the efficient frontier and plot the same
effFrontier1 <- portfolioFrontier(Portfolio1, Spec ,constraints = "LongOnly")
effFrontier1

plot(effFrontier1, c(1))

### End code  to run
########################################################


########################################################
# QUESTION 6: Describe what is an Efficient Frontier plot. 

#* A good answer will desribe the x-axis, y-axis, meaning of the x-axis,
#* meaning of the y-axis, and the points on the frontier.

## Answer:: Efficient frontier is a plot of showing Risk vs Return for a portfolio of assets
## X-axis is the Risk aka volatility of the portfolio and y-axis is the Return on the portfolio in excess of market return
## Efficient frontier is typically bullet shaped and represents a pattern of return of assets that shows
## what % distribution assets in portfolio will yield returns.
## One key point on the effificent frontier is the "Minimum variance portfolio" which represents a combination 
## of assets when risk/volatility is at minimum.
## One other line on such a plot is called Capital allocation line [CAL]. The point at which CAL is tangent to
## the efficient frontier is called tangency point and portfolio combination represented by that point is called
## tangency portfolio which is a point representing the maximum sharpe ratio.

#######################################################
#Run the following code

##Obtain the weights for each stock for the portfolio with the least variance
mvp1 <- minvariancePortfolio(Portfolio1, spec=portfolioSpec(),constraints="LongOnly")
mvp1

##Obtain the weights for each stock for the tangency portfolio
tanPort1 <- tangencyPortfolio(Portfolio1, spec=portfolioSpec(), constraints="LongOnly")
tanPort1

#Let us tabulate the weights for the two portfolios for comparison
minvarweights1 <- getWeights(mvp1) 
tanportweights1 <- getWeights(tanPort1)
weights1 <- (cbind(minvarweights1, tanportweights1))
colnames(weights1) <- c("Min. Variance Portfolio", "Tangency Portfolio")
weights1

### End code  to run
########################################################
#Questions 7 and 8 use the results from above.

#QUESTION 7.A:What is the Minimum Variance Portfolio?
##Minimum variance portfolio is
## ADS 49.32% and AMZN 50.67%

# Q7.B: What is the expected return of the Minimum Variance Portfolio?
## Expected return of the min variance portfolio is 5%

# Q7.C: What are the weights of the Minimum Variance portfolio.
##Weights are as follows --- ADS 49.32% and AMZN 50.67%

#QUESTION 8.A:What is the Tangency Portfolio?
## Tangency portfolio is as follows

##      Tangency Portfolio
## ADS   1.851217e-08
##AMZN   1.000000e+00

# Q8.B: What is the expected return of the Tangency Portfolio?
## expected return at the tangency portfolio is 10%

# Q8.C: What are the weights of the Tangency portfolio.

## Portfolio Weights:
## ADS      AMZN 
## 0.4932   0.5068
#* 