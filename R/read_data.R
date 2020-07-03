#' read_data
#' It's called by skeleton function and read the data

read_data <- function(config, path){
  
  n <- list()
  
  for (i in config$data$predictors){
    
    tryCatch(expr = {
      
      datos <- data.table::fread(pathDatos, sep = config$sep,
                                 encoding = 'UTF-8', data.table = FALSE)
      
      
    }, error = function(e){
      
      logerror("Data was not found on the path. Check the direction and the config",
               logger = 'log')
      stop()
    })
    
    if(nrow(datos) == 0 | ncol(datos) == 0){
      
      logerror("Data was read poorly, check data format.",
               logger = 'log')
      stop()
      
    }
    
    n <- n.append(datos)
    
    return(datos)
    
  }
  
}

read_target <- function(config, path){
  
  pathTarget <- paste0(path, "data/", config$data$target)
  
  tryCatch(expr = {
    
    target <- data.table::fread(pathDatos, sep = config$sep,
                               encoding = 'UTF-8', data.table = FALSE)
    
    
  }, error = function(e){
    
    logerror("Target was not found on the path. Check the direction and the config",
             logger = 'log')
    stop()
  })
  
  if(nrow(target) == 0 | ncol(target) == 0){
    
    logerror("Target was read poorly, check data format.",
             logger = 'log')
    stop()
    
  }
  
  return(target)
  
}
