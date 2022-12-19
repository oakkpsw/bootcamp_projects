library(mlbench)
library(caret)
library(dplyr)
library(tidyverse)

# data from https://www.kaggle.com/datasets/johnsmith88/heart-disease-dataset
df <- read_csv("heart.csv")

# explore data
glimpse(df)

#covert some column to factors
df$sex <- factor(df$sex)
df$cp <- factor(df$cp)
df$fbs <- factor(df$fbs)
df$restecg <- factor(df$restecg)
df$exng <- factor(df$exng)
df$slp <- factor(df$slp)
df$caa <- factor(df$caa)
df$thall <- factor(df$thall)
#change factor form 0,1 to  0 = no disease and 1 = disease.
df$output <- factor(df$output,
                    levels = c(0,1),
                    labels = c("no_disease","disease")) 
glimpse(df)

# train test split function
train_test_split <- function(data,size = 0.7){
  set.seed(42)
  n  <- nrow(data)
  id <- sample(n , size*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return (list(train_data,test_data))
}

#if return 1 data is no null
mean(complete.cases(df))

#split data
split_data <- train_test_split(df , 0.7)
train_data <- split_data[[1]]
test_data <- split_data[[2]]
#check row
nrow(train_data)
nrow(test_data)

## cv = use k-fold validation
set.seed(42) # if use k-fold 
ctrl <- trainControl(method = "cv",
                     number = 5 , # k=5
                     verboseIter = TRUE) 

# use  logistic regression
set.seed(42) 
glm_model <- train(output ~ . ,
                   data = train_data ,
                   method = "glm" ,
                   metric = "Accuracy",
                   trControl = ctrl)
p_glm<- predict(glm_model , newdata = test_data)



## build knn model
set.seed(42) 
knn_model <- train(output ~ . ,
               data = train_data ,
               method = "knn" ,
               metric = "Accuracy",
               trControl = ctrl)

p_knn<- predict(knn_model , newdata = test_data)


## build random forest model
set.seed(42) 
rf_model <- train(output ~ . ,
                    data = train_data ,
                    method = "rf" ,
                    metric = "Accuracy",
                    trControl = ctrl)
p_rf<- predict(rf_model , newdata = test_data)

## decision tree
set.seed(42) 
tree_model <- train(output ~ . ,
                   data = train_data ,
                   method = "rpart" ,
                   metric = "Accuracy",
                   trControl = ctrl)
p_tree<- predict(tree_model , newdata = test_data)


## evaluate multi models
list_models <- list (
  knn = knn_model,
  logistic = glm_model,
  tree = tree_model,
  random_forest = rf_model
)

result <- resamples(list_models)
summary(result)

glm_model$finalModel


confusionMatrix(p_glm,
                test_data$output,
                positive = "disease")

# use prcision recall
confusionMatrix(p_glm,
                test_data$output,
                positive = "disease",
                mode = "prec_recall")
