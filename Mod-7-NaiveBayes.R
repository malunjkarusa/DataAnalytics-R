## Student Name: Mandar Malunjkar
## Module#3 Assignment
# install package manager -pacman if not already loaded and load 5 packages listed below
if (!require("pacman")) install.packages("pacman") 
p_load(rsample, dplyr, caTools, caret, e1071)


# Read realEstate data file
real_es <- read.csv("realEstate.csv")

# Define input variables, col 2 to 9
X = real_es[,2:9]
# Define target variable, col 10
y = real_es[,10]

# Transforming all the numeric variables into categoric variables: Low-Med-High
# For that we will use the cut function in R, there are other options also.
# Listing all columns in data 
colnames(X)
# We expect following output -- "full_sq"    "life_sq"    "floor"      "max_floor"  "material"   "build_year" "num_room"   "kitch_sq"  

# Creating cuts/bins using following logic: low =   < mean - 1*sd, med = mean-1*sd - mean +1*sd, high = > mean+1*sd
# calculating these for each variable is not effcienct. Thus, we will scale all the variables and then use cut on all of them at a go

# normalizing all input variables 
# Normalize the inputs 
norm.values <- preProcess(X, method=c("center", "scale")) 
X.norm <- predict(norm.values, X) # Normalized input 

# Create a function that takes a variable and returns the same variables as "low", "med", "high" 
binning_func <- function(x){ 
  binx <- cut(x, c((min(x)), (mean(x)-1*sd(x)), (mean(x)+1*sd(x)), max(x)), labels=c("Low", "Med", "High"))
  return(binx)
}

# Apply this function to all the columns in the X.norm dataframe and saved all of them in X_binned dataframe
X_binned <- data.frame(apply(X.norm, 2, binning_func))

# Merging the Y variable with the X_binned to get the final dataset

df <- cbind(X_binned, y)

set.seed(101) # random seed for replicating the results
# train test split
sample = sample.split(df, SplitRatio = 0.80)# select a random sample of 80%
train <- subset(df, sample==TRUE) # training dataset
test <- subset(df, sample=FALSE) # testing dataset


# Perform Naive Bayes on 8 predictors 
Naive_Bayes_Model=naiveBayes(y ~ ., data=train)
Naive_Bayes_Model$tables

# Accuracy on training set 
train_predictions = predict(Naive_Bayes_Model, train[,-9]) # we reomved the ninth column (target variable)
confusionMatrix(train_predictions, train$y)# comparing actual price classes and predicted price classes in the train dataset
# Expected Accuracy - 0.712   

# Accuracy on the test set
test_predictions = predict(Naive_Bayes_Model, test[,-9])# we reomved the ninth column (target variable)
confusionMatrix(test_predictions, test$y)# comparing actual price classes and predicted price classes in the test dataset
# Expected Accuracy - 0.7105      
