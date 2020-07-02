leerConfig <- function(path){
  
  library(XLM)
  
  
  configPath <- paste0(path, "config/config.")
  
  
  tryCatch(expr = {
    
    #Leer el xml y convertirlo a lista
    config <- XML::xmlToList(xmlParse(configPath))
    
    
  }, error = function(e){
    
    logerror("Config no encontrado en su ruta. Verifica que se llame config.xml",
             logger = 'log')
    stop()
  })
  
  loginfo("Config leido.", logger = 'log')
  
  validateConfigNodes(config)
  
  config$data$predictors <- trimws(strsplit(config$data$predictors, ",")[[1]])
  config$data$target <- trimws(strsplit(config$data$target, ",")[[1]])
  confid$data$predictions$country <- trimws(confid$data$predictions$country, ",")[[1]])
  confid$data$predictions$year
 
  
  
  separadoresAceptados <- config$input$sep %in% c(",", ";")
  
  if(!separadoresAceptados){
    
    logerror("Sep solo puede valer ',' o ';' ", logger = 'log')
    stop()
    
  }
  
  return(config)
  
} 

#' @title validateConfigNodes
#'
#' @param config 
#'
#' @import logging
#' 
validateConfigNodes <- function(config){
  
  nodoPrincipal <- identical(names(config), c("input", "columnas"))
  nodoInput <- identical(names(config$input), c("name", "sep"))
  nodoColumnas <- identical(names(config$columnas), c("ID", "predictorasNumericas",
                                                      "fuenteOriginal", "dominio_mail",
                                                      "fechas", "mails", "target", "llamada"))
  
  nodoFechas <- identical(names(config$columnas$fechas), c("creacion", "ultima_mod",
                                                           "apertura_ultimo", "envio_ultimo",
                                                           "apertura_primero", "envio_primero",
                                                           "visita_primero", "visita_ultimo",
                                                           "tiempos"))
  
  nodoMails <- identical(names(config$columnas$mails), c("mailsDl", "mailsCl", "mailsOp", "ratios"))
  
  nodos <- c("nodoPrincipal" = nodoPrincipal, "nodoInput" = nodoInput, 
             "nodoColumnas" = nodoColumnas, "nodoFechas" = nodoFechas,
             "nodoMails" = nodoMails)
  
  check <- all(nodos)
  
  if(!check){
    
    nodosMalos <- names(nodos)[!nodos]
    
    logerror(paste0("Los nodos: ", paste(nodosMalos, collapse = ", "),
                    " estan mal estructurados!"), logger = 'log')
    stop()
    
  }
  
}
