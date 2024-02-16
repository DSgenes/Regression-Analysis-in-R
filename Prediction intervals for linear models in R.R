###Regression###
#  Regression is a statistical method that helps us understand and predict the relationship
#  between variables.

#Prediction and Confidence Intervals for linear models

library(tidyverse)
library(modeldata)
library(ggplot2)
data(penguins)

adelie <- filter(penguins, species == "Adelie",
                 !is.na(bill_length_mm))

View(adelie)

#let's have a vague idea that a linear model is appropriate here
ggplot(adelie, aes(x = bill_depth_mm,
               y = bill_length_mm)) +
  geom_point()

model <- lm(bill_length_mm ~ bill_depth_mm, data = adelie)
plot(model)

#let's apply a linear model
ggplot(adelie, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = "lm")
              

ggplot(adelie, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = "lm",
              level = .99)

predict(model)

predict(model, interval = "prediction")

adelie_new <- cbind(adelie, predict(model, interval = "prediction"))

ggplot(adelie_new, aes(x = bill_depth_mm)) +
  geom_point(aes(y = bill_length_mm)) +
  geom_line(aes(y = fit),
            col = "blue")

ggplot(adelie_new, aes(x = bill_depth_mm)) +
  geom_point(aes(y = bill_length_mm)) +
  geom_line(aes(y = fit),
            col = "blue") +
  geom_line(aes(y = upr),
            col = "blue",
            linetype = "dashed")

ggplot(adelie_new, aes(x = bill_depth_mm)) +
  geom_point(aes(y = bill_length_mm)) +
  geom_line(aes(y = fit),
            col ="blue") +
  geom_line(aes(y = upr),
            col = "blue",
            linetype = "dashed") +
  geom_line(aes(y = lwr),
            col = "blue",
            linetype = "dashed")

abline_new <- cbind(adelie, predict(model, 
                                   interval ="prediction",
                                   level = .90))
-------------------------------------------------------------------------------------------