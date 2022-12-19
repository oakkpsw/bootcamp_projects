# -*- coding: utf-8 -*-

# -- Sheet --

install.packages("titanic")


#Import required library
library("titanic")
library(tidyverse)

head(titanic_train)

glimpse(titanic_train)

# drop na
titanic_train <- na.omit(titanic_train)
nrow(titanic_train)

# change Survived to factor 
titanic_train$Survived <-factor(titanic_train$Survived, 
                            levels=c(0,1),
                            labels=c("Died","Survived"))

glimpse(titanic_train)


train_test_split <- function(data, train_size=0.8){
  set.seed(42) #lock result
  n<- nrow(data)
  id <- sample(1:n , size = n*train_size)
  train_data <- data[id,]
  test_data <- data[-id,]
  
  return(list(train_data,test_data))
}

split_data<- train_test_split(titanic_train,0.75)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

# ## Train DATA


model <- glm(Survived ~ Pclass + Age + Sex + SibSp + Parch, 
            data = train_data, 
            family="binomial")

p <- predict(model , data = train_data)
#probability
train_data$predicted <- if_else(p <= 0.5, "Died", "Survived")
##acc
acc_train <- mean( train_data$predicted == train_data$Survived)

# ##Test DATA


p <- predict(model , newdata = test_data)
test_data$predicted <- if_else(p <= 0.5, "Died", "Survived")

# ## Model Evalutaion 


## confusion matrix table(x,y)
### for train data
connM <- table(train_data$predicted , train_data$Survived , dnn = c('predicted','actual'))
accuracy <- (connM[1,1]+connM[2,2]) / sum(connM)
cat ("Accuracy : ", accuracy)
precision <- connM[2,2] / (connM[2,1]+connM[2,2]) 
cat ("\nprecision : ", precision)
recall <- connM[2,2] / (connM[1,2]+connM[2,2]) 
cat ("\nrecall :" , recall)
f1 <- 2*precision*recall / (precision+recall)
cat("\nf1-score:", f1 )

### for test data
connM <- table(test_data$predicted , test_data$Survived , dnn = c('predicted','actual'))
accuracy <- (connM[1,1]+connM[2,2]) / sum(connM)
cat ("Accuracy : ", accuracy)
precision <- connM[2,2] / (connM[2,1]+connM[2,2]) 
cat ("\nprecision : ", precision)
recall <- connM[2,2] / (connM[1,2]+connM[2,2]) 
cat ("\nrecall :" , recall)
f1 <- 2*precision*recall / (precision+recall)
cat("\nf1-score:", f1 )

