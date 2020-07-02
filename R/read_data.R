#' read_data
#' It's called by skeleton function
#' reads the data and cleans it

read_data <- function(config, path){
  
  n <- list()
  
  for (i in config$data$predictors){
    
    tryCatch(expr = {
      
      datos <- data.table::fread(pathDatos, sep = config$sep,
                                 encoding = 'UTF-8', data.table = FALSE)
      
      
    }, error = function(e){
      
      logerror("Datos no encontrado en su ruta. Verifica el directorio de data y el config",
               logger = 'log')
      stop()
    })
    
    if(nrow(datos) == 0 | ncol(datos) == 0){
      
      logerror("Datos mal leido, verifica que tengan un buen formato. ",
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
    
    logerror("Target no encontrado en su ruta. Verifica el directorio de data y el config",
             logger = 'log')
    stop()
  })
  
  if(nrow(target) == 0 | ncol(target) == 0){
    
    logerror("Target mal leido, verifica que tengan un buen formato. ",
             logger = 'log')
    stop()
    
  }
  
  return(target)
  
}
