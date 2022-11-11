#Homework 8 - Maximum Likelihood
#Authors: Jess, Ian, & Emily
#Date Submitted: 11/14/22

########  Q1  #####
#Simulate some data for a linear regression using the simple linear regression model. Make sigma large enough that it resembles “typical” ecological data when you plot it, but not so large that it completely obscures the relationship between x and y.
#Record your true beta_0, beta_1, and sigma here:
beta_0 <- 4
beta_1 <- 0.75
sigma <- 4

# Simulate data from set parameters with error
x <- 1:50
y_obs <- beta_0 + beta_1*x + rnorm(length(x), mean=0, sd=sigma)
plot(y_obs ~ x)

#Fit a linear regression model using lm() and do your typical checks of model assumptions that we went over in class.
mod <- lm(y_obs ~ x)

#Paste your estimated model coefficients and their 95% confidence intervals below:
summary(mod)
coef(mod)
confint(mod, level = 0.95)

#Are the coefficient estimates close to the true values?  Do the 95% confidence intervals cover the true values?
#yes the estimates are close and the true values fall within the confidence intervals. 

#Relevant functions: rnorm()



######  Q2  ######
#: Analyze the data generated in Q1 using the normal equation:Beta hat = (X^T X) ^-1 X^T y Paste your estimated model coefficients below.
X <- cbind(rep(1, length(x)), x) 

bhat <- solve(t(X)%*%X) %*% (t(X)%*%y_obs) 

#Are the coefficient estimates close to the true values?  
#Yes, they are the same the model in Q1

#Relevant functions: solve(), t()

#####   Q3     #####
#Analyze the data generated in Q1 using a grid search to minimize the sum of squared errors (no need to iterate more than twice):
#function going through y_obs, subtracting beta_0 + beta_1*x, squaring it, then sum all of them
#For a bunch of things around 4 and 0.75 

#Create possible range of slopes and intercepts to search through
slopes <- seq(from = 0.5, to = 1, length.out = 10)
intercepts <- seq(from = 0, to = 8, length.out = 10)
#Make empty matrix to save values to
grid1 <- matrix(data = NA, nrow = 10, ncol = 10)

#Create function to calc sum of squares
sumsq = function(y_obs, x, b0, b1) {
  y_exp = b0 + b1*x
  squares = ((y_obs - y_exp)^2)
  sums = sum(squares)
  return(sums)
}

for (i in 1:length(slopes)) {
  for (j in 1:length(intercepts)) {
    
    output = sumsq(y_obs = y_obs, x = x, b0 = intercepts[j], b1 = slopes[i])
    
    grid1[j,i] = output
  }
}


#Paste your estimated model coefficients below.

##### Q4  #####
#Analyze the data generated in Q1 using a grid search to minimize the negative log likelihood (no need to iterate more than twice).  Note, there is a third parameter that you will need to estimate here: sigma
#Paste your estimated model coefficients below


######  Q5   ######
#Analyze the data generated in Q1 using optim() to minimize the negative log likelihood.  Note, there is a third parameter that you will need to estimate here: sigma
#Paste your estimated model coefficients below.


#Did the numerical optimization algorithm converge?  How do you know?
#Did the numerical optimization algorithm find a global solution?  How do you know?
  

##### Q6  #####
#Plot a likelihood profile for the slope parameter while estimating the conditional MLEs of the intercept and sigma for each plotted value of the slope parameter (see p. 173 of Hilborn and Mangel)


##### Q7  #####
#Plot the joint likelihood surface for the intercept and slope parameters.  Is there evidence of confounding between these two parameters (i.e., a ridge rather than a mountain top)?



##### Q8   ######
#How different are the estimated coefficients from Q1, Q2, and Q5 and how do they compare to the true values?