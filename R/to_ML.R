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
  
  x <- dataset[,-1]
  y <- dataset[,1]
  
  # Linear Regression
  set.seed(7)
  fit.lda <- train(y, data=dataset, method="lda", metric=metric, trControl=control)
  
  # CART
  set.seed(7)
  fit.cart <- train(y, data=dataset, method="rpart", metric=metric, trControl=control)
  # KNN
  set.seed(7)
  fit.knn <- train(y, data=dataset, method="knn", metric=metric, trControl=control)
  
  # SVM
  set.seed(7)
  fit.svm <- train(y, data=dataset, method="svmRadial", metric=metric, trControl=control)
  # Random Forest
  set.seed(7)
  fit.rf <- train(y, data=dataset, method="rf", metric=metric, trControl=control)
  
  models <- c(fit.lda, fit.cart, fit.knn, fit.svm, fit.rf)
  
  return(models)
}