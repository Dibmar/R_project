# to_ML
# This function is called by skeleton
# Hooks the df onto a machine learning model
library(caret)
library(logging)
to_ML <- function(df_1, config){

<<<<<<< HEAD
   df_orig <- data.frame(df_1[1])
   predict_y <- data.frame(df_1[2])
  # 1a columna seleccionada como target
  validation_index <- createDataPartition(df_orig[, ncol(df_orig)], p=0.80, list=FALSE)
  test_df <- df_orig[-validation_index,]
  train_df <- df_orig[validation_index,]
 
  
  # Simple linear regression model (lm means linear model)
  #model_1 <- train(,data = train_df, method = "lm")
  model_1 <- train( train_df[,3:(ncol(train_df)-1)], train_df[, ncol(train_df)], method = 'lm')
=======
to_ML <- function(df_1){
  library(caret)
  library(logging)
  library(dplyr)
  

  # Split between TRAIN (validation_index, 80% of data) and TEST (validation, 20% of data) samples
  validation_index <- createDataPartition(df_1[, 1], p=0.80, list=FALSE)
  validation <- df_1[-validation_index,]
  
  dataset <- dataset[validation_index,]
  
  
  # For the training
  x_train <- dataset[,-5]
  y_train <- dataset[,5]
  
  
  # Logging
  loginfo("Resumen estadístico", logger = 'log')

  dataset_summary <- summary(dataset)
  
  loginfo(dataset_summary, logger = 'log')
  loginfo("Resumen terminado", logger = 'log')
  
  
  # Simple linear regression model (lm means linear model)
  model_1 <- train(x = x_train, y = as.numeric(y_train), method = "lm")
>>>>>>> 658077ec75988c42c0dc3fae2a077d174d48c465
  

  # Logging results
  loginfo("Resumen de modelo de ML", logger = 'log')
  
  #results <- resamples(model_1)
  #summary(results)
  predict_test <- predict(model_1, test_df[,3:(ncol(test_df)-1)])
  #loginfo(results, logger = 'log')
  loginfo("Resumen de modelo de ML terminado", logger = 'log')


  return(model_1, validation)

 
  
<<<<<<< HEAD
  RMSE <- sqrt(mean((predict_test - test_df[, ncol(train_df)])^2))

  resultado <- predict(model_1, predict_y) 
  predict_y[, ncol(predict_y)] <- resultado
  output <- predict_y
  return(output)
}
=======
 }

>>>>>>> 658077ec75988c42c0dc3fae2a077d174d48c465
