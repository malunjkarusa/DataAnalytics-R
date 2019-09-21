#white noise

w <- rnorm(5) ## 5 random standard normal numbers
w
plot(w) # dot plot of w
plot(w, type = "line") #line plot of w

w2 <- rnorm(500) # 500 random standard normal numbers

plot(w2,type = "line")
mean(w2)

