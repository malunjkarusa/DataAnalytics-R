## A/B testing
##install.packages("mosaicData")
library("mosaicData")
data(SaratogaHouses)

mean(SaratogaHouses$price)

t.test(SaratogaHouses$price)

## Do a t-test to test whether the true mean housing price in Saratoga 
## is $200,000

## One sample T-test example
t.test(SaratogaHouses$price)
t.test(SaratogaHouses$price, mu = 200000)

## Notes:: The p-value is 2.2e-16, which is smaller than 0.05
## So, we can reject the null hypothesis under the significance level of 0.05
## and conclude that the true mean housing price in Saratoga is not $200,000

## Two sample T-test example
## split the data in 2 groups
## houses in one group have central air and other dont

x = SaratogaHouses$price[SaratogaHouses$centralAir == "Yes"] 
y = SaratogaHouses$price[SaratogaHouses$centralAir == "No"]

length(x)
length(y)

## generate a boxplot of of the housing prices in 2 groups
boxplot(x,y)

## Perform an unparied 2-sample t-test to test
## whether there is a difference in housing prices between the 2 groups
## Note that the t.test(x,y) assumes unequal variances by default
t.test(x,y, paired = F)
## We get p-value < 2.2e-16, which is smaller than 0.05
## So we can reject the null hypothesis under the significance of 0.05
## and conclude that there is a difference in housing prices between 2 grousp

