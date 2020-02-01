## Student Name: Mandar Malunjkar
## Module#3 Assignment
# install package manager -pacman if not already loaded and load 5 packages listed below
if (!require("pacman")) install.packages("pacman") 
p_load(rsample, dplyr, caTools, caret, e1071, FNN) 

# dataset has 31 variables, we will use only 10 variables, 1 target and 9 input (all numerical)
dim(attrition)

# Subset of dataframe 
attrition.df <- attrition[,c("Age", "MonthlyIncome", "DistanceFromHome", "TotalWorkingYears", "TrainingTimesLastYear", "YearsAtCompany","YearsInCurrentRole", 
                             "YearsSinceLastPromotion", "YearsWithCurrManager", "Attrition")] 

### Since KNN is a distance based algorithm, we need to scale it so that different variables can be brought to the same scale
# get all the input variables in one dataframe X
X <- attrition.df[,1:9]   # selecting all input variables 

# Normalize the inputs 
norm.values <- preProcess(X, method=c("center", "scale")) 
X.norm <- predict(norm.values, X) # Normalized input 

y <- attrition.df$Attrition # target variables

set.seed(101)

# train test split for assesing prediction accuracy
sample = sample.split(attrition.df$Attrition, SplitRatio = 0.80)# seelect a random sample of 80% 
X_train = subset(X.norm, sample==TRUE) # input for training
X_test = subset(X.norm, sample==FALSE) # input for prediction accuracy

y_train = subset(y,sample==TRUE) # labels for training
y_test = subset(y, sample==FALSE)# labels for prediction accuracy

# Using k =3 
nn <- knn(train = X_train, test=X_test, cl = y_train, k=3)
summary(nn)
confusionMatrix(nn, y_test)$overall[1]# accuracy of prediction on test data 
# Accuracy 
# 0.82 

confusionMatrix(nn, y_test) # evaluate other metrics

# To select the best K, we will check accuracy as various values of K between 1 and 20. 

# define a dataframe in which we will save accuracy for different values of K
accuracy.df <- data.frame(k = seq(1, 20, 1), accuracy = rep(0, 20))
accuracy.df # right now we have filled accurcay to be 0 for all values of K

# compute knn for different k on validation by looping 
for(i in 1:20) { # we will loop through K= 1 to 20
  knn.pred <- knn(train = X_train, test=X_test, cl = y_train, k = i)
  accuracy.df[i, 2] <- confusionMatrix(knn.pred, y_test)$overall[1]
}

plot(accuracy.df) # plot accuracy for different values of K 
lines(accuracy.df)

which.max(accuracy.df$accuracy) # optimal K
# K = 13  
# Evaluate model at K =13
accuracy.df[13,] # read 11th row
# expected accuracy 0.82
