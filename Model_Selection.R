
install.packages("leaps") # for best subset regression
install.packages("caTools") # for train test split
library(leaps)
library(caTools)

getwd() # gets the working dir -- default working dir is "C:\Users\Mandar\Documents"
#setwd("") ## sets the working dir

#read data
Toyota <- read.csv("ToyotaCorolla.csv")

sample = sample.split(Toyota, SplitRatio = 0.80) #Splitting the data into 80 and 20
train = subset(Toyota, sample == TRUE)
test = subset(Toyota, sample == FALSE)

#Run the best subset model - This allows you to find the best set of predictors based on 
#some criterias such as "ADJ_RSq", "CP", "BIC" etc.
models <- regsubsets(Price~., data = Toyota, nvmax = 9, method = "forward")
#nvmax represents the max no. of predictors to incorporate
#method represents the procedure you want to implement for selection: exhaustive/bkwd/fwd

summary(models) #get the results of your model

res.sum <- summary(models)
which.max(res.sum$adjr2)

