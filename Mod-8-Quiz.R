install.packages("recommenderlab") # remove the # to run this command if the package is not only installed
library("recommenderlab")#load the package 
data("MovieLense")  # load the data on Movie rating from the package

### use only users with more than 50 ratings
MovieLense50 <- MovieLense[rowCounts(MovieLense) >50,] 
MovieLense50

# train on first 500 cases
train <- MovieLense50[1:500]

# Generating recommendation  ,,method = userbased collaborative filtering
recom <- Recommender(train, method = "UBCF")
recom

# Create top-N recommendations for new users (users 111 and 112)
pred <- predict(recom, MovieLense50[111:112], n = 10) # we are asking to predict top 10 recommendations for 2 users
pred


# Recommendations
as(pred, "list")
