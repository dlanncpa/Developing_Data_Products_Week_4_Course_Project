library(caret)
data("mtcars")

head(mtcars)
str(mtcars)

fit<-lm(mpg ~ wt, mtcars)
summary(fit)$coef
summary(fit)$r.squared