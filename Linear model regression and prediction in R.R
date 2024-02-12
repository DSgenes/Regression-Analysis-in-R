###Linear Regression###
#  A linear regression model describes the relationship between a dependent variable, y, 
#  and one or more independent variables, X. The dependent variable is also called the response 
#  variable. Independent variables are also called explanatory or predictor variables.

library(tidyverse)

View(cars)

qplot(speed, dist, data = cars, geom = "point")

#throw a regression line onto this graph
qplot(speed, dist, data = cars, geom = "point") +
  geom_smooth(method = "lm", se = FALSE)

lm(dist ~ speed, data = cars)

model <- lm(dist ~ speed, data = cars)
summary(model)

View(model)
#let's go with residuals in this case
model$residual

cars$residual <- model$residuals
View(cars)

cars$predicted <- model$fitted.values
View(cars)

predict(model , data.frame(speed = c(12.5, 15.5, 17)))
-------------------------------------------------------------------------------------------