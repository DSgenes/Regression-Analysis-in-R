###Multiple Regression###
#  Multiple regression is a statistical technique that can be used to analyze the relationship
#  between a single dependent variable and several independent variables.

library(tidyverse)
library(broom)
library(GGally)

#selected out the fourth column of that parenthood dataset
parenthood <- select(parenthood, 1:3)
glimpse(parenthood)

ggpairs(parenthood)

#linear relationship between our response variable and the explainers
model <- lm(dan.grump ~ ., 
            data = parenthood)
summary(model)

model_baby <- lm(dan.grump ~ baby.sleep,
                 data = parenthood)
summary(model_baby)

model_dan <- lm(dan.grump ~ dan.sleep, 
                data = parenthood)
summary(model_dan)

glance(model)
glance(model_baby)
glance(model_dan)
------------------------------------------------------------------------------------------