
install.packages("leaps") # for best subset regression
install.packages("caTools") # for train test split
library(leaps)
library(caTools)

getwd() # gets the working dir -- default working dir is "C:\Users\Mandar\Documents"
#setwd("") ## sets the working dir

#read data
Windsor <- read.csv("Housing_windsor.csv")

sample = sample.split(Windsor, SplitRatio = 0.80) #Splitting the data into 80 and 20
train = subset(Windsor, sample == TRUE)
test = subset(Windsor, sample == FALSE)

#Run the best subset model - This allows you to find the best set of predictors based on 
#some criterias such as "ADJ_RSq", "CP", "BIC" etc.
models <- regsubsets(price~., data = Windsor, nvmax = 6, method = "exhaustive")
#nvmax represents the max no. of predictors to incorporate
#method represents the procedure you want to implement for selection: exhaustive/bkwd/fwd

summary(models) #get the results of your model

res.sum <- summary(models)
which.max(res.sum$adjr2)

