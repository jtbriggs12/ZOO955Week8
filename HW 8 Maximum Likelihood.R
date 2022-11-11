#Homework 8 - Maximum Likelihood
#Authors: Jess, Ian, & Emily
#Date Submitted: 11/14/22

########  Q1  #####
#Simulate some data for a linear regression using the simple linear regression model. Make sigma large enough that it resembles “typical” ecological data when you plot it, but not so large that it completely obscures the relationship between x and y.
#Record your true beta_0, beta_1, and sigma here:


#Fit a linear regression model using lm() and do your typical checks of model assumptions that we went over in class.
#Paste your estimated model coefficients and their 95% confidence intervals below:


#Are the coefficient estimates close to the true values?  Do the 95% confidence intervals cover the true values?


#Relevant functions: rnorm()



######  Q2  ######
#: Analyze the data generated in Q1 using the normal equation:Beta hat = (X^T X) ^-1 X^T y Paste your estimated model coefficients below.
#Are the coefficient estimates close to the true values?  

#Relevant functions: solve(), t()

#####   Q3     #####
#Analyze the data generated in Q1 using a grid search to minimize the sum of squared errors (no need to iterate more than twice):

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