##############################------------PCA-----------##########################################

getwd() # Check the working directory. You should keep your data file in this folder
# setwd("mention the path of your folder") # this allows you to set a folder of your choice 
# as the working directory

# Griliches Wages data
wages <- read.csv("Griliches.csv") # read data from the file in the working directory
wages_subset <- wages[,c("iq" , "age80", "school80", "expr80", "tenure80")] # select only these variables for 
# further analysis 

pca_wages <- prcomp(wages_subset, center = TRUE, scale. = TRUE) 
summary(pca_wages)# output of PCA model

# Proportion of Variance explained by 5 PCs 0.3969 0.2760 0.1495 0.1184 0.05907

######################################XXXXXX--END--XXXXXXXXXXXXX###################################