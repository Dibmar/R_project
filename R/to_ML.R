# to_ML
# This function is called by skeleton
# Hooks the df onto a machine learning model

to_ML <- function(df_1){
  library(caret)
  library(logging)
  
  # 1a columna seleccionada como target
  validation_index <- createDataPartition(df_1[, 1], p=0.80, list=FALSE)
  validation <- df_1[-validation_index,]
  
  dataset <- dataset[validation_index,]
  
  loginfo("Resumen estadístico", logger = 'log')
  dataset_summary <- summary(dataset)
  loginfo(dataset_summary, logger = 'log')
  loginfo("Resumen terminado", logger = 'log')
  
  # Simple linear regression model (lm means linear model)
  model_1 <- train(mpg ~ wt,data = dataset, method = "lm")
  
  
  loginfo("Resumen de modelo de ML", logger = 'log')
  
  results <- resamples(model_1)
  summary(results)
  
  loginfo(results, logger = 'log')
  loginfo("Resumen de modelo de ML terminado", logger = 'log')
  
  
  return(model_1)
}