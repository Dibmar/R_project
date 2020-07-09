# to_ML
# This function is called by skeleton
# Hooks the df onto a machine learning model

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
  

  # Logging results
  loginfo("Resumen de modelo de ML", logger = 'log')
  
  results <- resamples(model_1)
  summary(results)
  
  loginfo(results, logger = 'log')
  loginfo("Resumen de modelo de ML terminado", logger = 'log')


  return(model_1, validation)

 
  
 }

