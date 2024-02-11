###Regression###
#  Regression analysis is a reliable method of identifying which variables have impact on
#  a topic of interest. The process of performing a regression allows you to confidently 
#  determine which factors matter most, which factors can be ignored, and how these factors
#  influence each other.
  
#Ratings of a supervisor by their employees we've the overall_rating of that supervisor that's
#going to be our response variable of interest and then we've got six potential explainers
#the idea is we can hopefully fit a linear regression modelto all these variables

library(tidyverse)
library(broom)
library(GGally)

performance = read.csv(file.choose(), header = T)
View(performance)

ggpairs(performance)

#Backward stepwise variable selection :
#variable selection through the lens of regression analysis to know which variables really
#are potentially important 
#use the t-statistic to decide which variable to throw away at each step.Keep going on as long
#as you've a t-statistic under 1.

#Throw the variables away one by one whose t-statistic values are closer to 0 
model_6 <- lm(overall_rating~., data = performance)

summary(model_6)

model_5 <- update(model_6,.~. -not_overly_critical)
summary(model_5)

model_4 <- update(model_5, .~. -raises_for_performance)
summary(model_4)

#so our t-value are all over one in absolute value so our stopping criteria has been met

model_3 <- update(model_4, .~. -no_special_privileges)
summary(model_3)

#residual plot
perf_aug <- augment(model_3)
View(perf_aug)

#How does AIC compare between these models
model_list <- list(model_6,
                   model_5,
                   model_4,
                   model_3)

lapply(model_list,
       extractAIC)
-----------------------------------------------------------------------------------------