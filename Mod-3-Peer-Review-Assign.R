#############################################################
#
# Financial Analytics Assignment 2
#
# In this assignment, you are asked to use some of the 
# commands demonstrated in the video examples to analyze
# the problem.  You will then be asked to interpret the 
# results.  
#
# For this assignment, you may use any resources necessary
# to be able to exectute the code.  However, the interpretation 
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


data(pigs)                   # This load the  dataset into R from fma library

# see https://cran.r-project.org/web/packages/fma/fma.pdf for details.


# The data a time series of monthly total number of pigs
# slaughtered in Victoria, Australia (Jan 1980 - Aug 1995)
# 

#*** START CODING: Question 1

# Q.1  Display the first 24 data points using the head() function.  Familiarize
# yourself with the structure of the data.
head(pigs, 24)
## this shows no. of pigs slaughtered in Victoria, Australia in the year 1980 and 1981.

# Q.2 Use the autoplot()  command to graph the pigs data.

autoplot(pigs)

# Q.3 Describe the plot.

#* A good answer will describe the x-axis, y-axis, and any trends.
## Mandar Malunjkar::
## This plot shows no. of pigs slaughtered on y-axis and year (timeline) on x-axis. Plot also shows a drastic drop
## in no. of pigs slaughtered in March 1980 and the number picks right back up in April 1980. Data is fairly evenly spread
## except for another drop todards the end of 1987.


# Q.4 Use the seasonplot()  command to graph the pigs data.
seasonplot(pigs)

# Q.5 Describe the plot.
## This plot shows yearly data as a line graph. Data shows that typically no. of pigs slaughtered is higher in August
## Decemnber. As noted above, data is fairly evenly spread with a few drop in numbers.


# Q.6 Create an ARIMA model using the auto.arima() command and the pigs data. 

Fitted.Arima = auto.arima(pigs)
summary(Fitted.Arima)
# Q.7 What are the paremeters for the ARIMA model using the data 'pigs'? 
# In other words what is the model (ARIMA (p,d,q)(P,D,Q)) and what do the parameters mean?
## Running the sumamary command, we see that auto arima command has used --
## ARIMA(2,1,0) and (2,0,0)

#Q.8 What is the AIC value?

## AIC=3954.06

#Q.9 What is the AIC used for?
## AIC value is used by R's auto.arima function to select the right ARIMA function/model
