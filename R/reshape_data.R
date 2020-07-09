# reshape_data
# This function is called by skeleton
# Reshapes the df to a [n, 2] shape


  
  
  reshape_data <- function(config, lista_datas){
    
    
  for (i in 1:length(lista_datas$predictoras)){
    
      col = colnames(lista_datas$predictoras[[i]])
      lista_datas$predictoras[[i]] <- reshape2::melt(data = lista_datas$predictoras[[i]], 
                                           id.vars = 'country', 
                                           measure.vars = col[!(col %in% "country")],
                                           value.name = config$data$predictors[i])
  }
  
  col = colnames(lista_datas$target)
  lista_datas$target <- reshape2::melt(data = lista_datas$target,
                             id.vars = 'country',
                             measure.vars = col[!(col %in% "country")],
                             value.name = config$data$target)
  
    
         
  df <- lista_datas$predictoras[[1]]
  
  for (i in 2:length(lista_datas$predictoras)){
    
      df <- merge(df, lista_datas$predictoras[[i]], by = c('country', 'variable'))
  }
  
  df <- merge(df, lista_datas$target, by = c('country', 'variable'))

  datos <- na.omit(df)

  return(datos)
    
}
