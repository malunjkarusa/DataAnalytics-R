
################ MANDAR MALUNJKAR - Module#2 Peer review assignment #####################
#
# Financial Analytics Assignment
#
# In this assignment, you are asked to use some of the 
# commands demonstrated in the video examples to analyze
# the problem.  You will then be asked to interpret the 
# results.  
#
# For this assignment, you may use any resources necessary
# to be able to execute the code.  However, the interpretation 
# should reflect your thinking.
#
# You are to work on the problem alone, without help 
# from any other person.
#
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

library(fma)
library(ggplot2)

### end required libraries

### Run the following code

data(housing)                   # This load the housing dataset into R

hstarts <- housing[,'hstarts']  # This line moves one column of housing 
# to a variable called hstarts.

# The data housing is a time series dataset with three columns.  
# We will only use one column to simplify the code.
# This data is the monthly housing starts from Jan. 1983 - Oct. 1989.

######################################################################
######################################################################
#*** START CODING:  Question 1

# Q1.A Inspect the first 10 elements of hstarts using the head() command.
head(hstarts, 10)

# Q1.B Plot the hstarts data using autoplot().
autoplot(hstarts)

# Q1.C Describe the plot in your own words.
# (answer here - remember to use hash tags for comments)

# Mandar Malunjkar:: 
# Housing dataset shows seasionality trends.Typically numbers are higher towards Q2 and Q3 and 
# drop towards the end of year and start of the year. This shows that not a lot of people are buying houses
# in winter and holiday months in USA. End of year 1987 and early 1988 seems to show a massive drop from mid-1987.
# home sales seem to have peaked in Q2 of 1986.

# Q1.D Plot the hstarts data using the seasonplot() command.
seasonplot(hstarts)

# Q1.E Describe and interpret the season plot in your own words.
# (answer here - remember to use hash tags for comments)

# Mandar Malunjkar:: 
# Season plot of housing dataset shows seasionality/cyclical trends. X-axis shows months in a year where as y-axis
# shows house sales in thousands.This plot further confirms that house sale numbers are higher towards Q2 and Q3 and 
# drop towards the end of year and start of the year. 
# This shows that not a lot of people are buying houses in winter and holiday months in USA. As we can see from plot,
# home sales go down starting Sept, sometime rise in Oct, but then continue to drop till Jan of next year, and then start
# picking up in Feb to reach their peak in April to August timeframe.
# This pattern is also cyclical i.e. it repeats every year for the given dataset.

#*** END CODING: Question 1

###------------------------------------------------------------------------------------------------

### QUESTION 2

# The next set of questions analyze the kkong dataset.  
# using linear regression.

data(kkong)   # This data set has height and weight of 21 gorillas.
attach(kkong) # This command allows you to reference just the column names.
# The column names are 'weight' and 'height'.

#*** START CODING:  Question 2

# Q2.A Use the summary() command on the column 'height' and 'weight'.
summary(kkong$height)
summary(kkong$weight)

# Q2.B Describe the results in your own words. Include

## Output of summary function below in comments
# a description of the range, min, max, and central tendencies will suffice.

# Mandar Malunjkar::
# Height ranges from 13 (minimum) to 150 (maximum) units. Median height is 29 units and mean height is 35.14
# Weight ranges from 31 (minimum) to 130 (maximum) units. Media weight is 47 and mean weight is 50

#> summary(kkong$height)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#13.00   25.00   29.00   35.14   35.00  150.00 
#> summary(kkong$weight)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#31      41      47      50      53     130 

# Q2.C Plot the data using the command plot().
plot(kkong)

# Q2.D Describe the results in your own words.

#* The desciption should include a description of the graph and a description
#* of the data clustered around the bottom left corner 
#* as well as a discussion of the one outlier at the top left.

# Mandar Malunjkar::
# plot command above, plots the kkong data as a point chart. As can be seen from the chart, most of the data points are
# close to the left corner, indicating that thre is not much variation in data. Data also shows that weight of a gorilla
# is linearly proportional to its height. However, there are a few outliers. There is one data point showing that 
# one gorilla has weight of about 30 units and height of around 30 units. 2 other outliers show that their height is
#above 40 units, where as their weight is close to 50 units.


# Q2.E Run a regression using height as the dependent variable
#      and store the results in 'fit'.  Use the summary() command to see 
#      the results.

## Running regression (linear model) where
# height = dependent var and weight as independent var
fit <-lm(height ~ weight, data=kkong) ## Fit a linear reg 
summary(fit)

# Q2.F From the results answer the following (short answer):
#   - What is the coefficient for weight?
#   - Is the coefficient significant?
#   - What does the coefficient mean? In other words, interpret the coefficient.
#   - What is the Adjusted R-squared and what does it mean?

# - Coefficient for weight = 1.3078
# - No, the coefficient is not significant, indicated by ***
# - Coefficient of weight mean that for every 1 unit rise in height, weight increases by 1.3078 units
# - Adjusted R-sq is the fit of this linear regression model that tells us how much of this data can be explained by the 
#   model. Value of adjusted R-sq is 0.8782.

#*** END CODING:  Question 2
###------------------------------------------------------------------------------------------------

#*** START CODING:  Question 3

# In this question, we will using the hstarts time series used in Question 1.
# Q3.A  Create a moving average of hstarts using 5 lags and store it in hstartsMA5.
hstartsMA5 <- ma(hstarts,5)

# Q3.B  Create a moving average of hstarts using 15 lags and store it in hstartsMA15.
hstartsMA15 <- ma(hstarts,15)

# RUN the following lines to make a graph.
plot(hstartsMA5, col = 'red')
lines(hstartsMA15, col = 'green')

# Q3.C  Describe the two moving average plots in your own words.
# Mandar Malunjkar::
# Moving averages - with lag 5, we see less smoothing of data. We observe that plotted graph shows seasonality and
# trend in data points. And with lag = 5, we don't get much smoothing effect
# With lag = 15, we see a good amount of smoothing and data points are much less erratic.

#*** END CODING:  Question 3
###------------------------------------------------------------------------------------------------

#*** START CODING:  Question 4
# 

# Q4.A Create a simple exponential smoothing series using ses()
#     with h=5 lags and store it in hstartsSES5

hstartsSES5 <- ses(hstarts, h=5)

# Q4.B What is the RMSE?  (Use the accurancy() command.)

accuracy(hstartsSES5)
# RMSE is 19.46083

# Q4.C Create a Holt-Winters model using the hw() command and store it in hstartsHWa 
#      using the option : seasonal = "additive". 

hstartsHWa <- hw(hstarts, seasonal = "additive")
  

# Q4.D Create a Holt-Winters model using the hw() command and store it in hstartsHWm 
#      using the option : seasonal = "multiplicative".

hstartsHWm <- hw(hstarts, seasonal = "multiplicative")


# run the following to create the plot

autoplot(hstarts) +
  autolayer(hstartsHWa, series="HW additive forecasts",
            PI=FALSE) +
  autolayer(hstartsHWm, series="HW multiplicative forecasts",
            PI=FALSE) +
  ggtitle("Housing Starts") +
  guides(colour=guide_legend(title="Forecast"))

# Q4.E Which model (additive or multiplicative) looks better and why?

## Mandar Malunjkar ::
# Looking at the plots, one can observe that both models (additive and multiplicative) are good forecasts as they both 
# show cyclical nature of data set along with seasonality. Both plots also show a sharp drop starting in 1987.
# From the course lecture, we know that multiplicative forecast will use a % of past changes; however multiplicative
# also seems to dampen the cycles as can be seen visually in the plotted graph.

#*** END CODING:  Question 4