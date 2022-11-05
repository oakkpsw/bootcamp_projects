#build a regression model

head(mtcars)

model <- lm(mpg ~ho + wt , data = mtcars)
summary(model)
