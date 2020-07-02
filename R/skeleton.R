#' skeleton 
#' Main package function


skeleton <- function (path){
  tryCatch(expr = {
    
    #Creación del log
    
    #Lectura del path
    path_1 <- read_config(path)
    
    #Lectura de datos
    df <- import_data(path_1)
    
    #Limpieza de datos
    df_1 <- read_data(df)
    
    #Reestructuración de los datos
    df_1 <- reshape_data(df_1)
    
    #Carga de modelo de ML
    df_model <- to_ML(df_1)
    
    #Crosvalidation
    data <- check_model(df_model)
    
    #Despedida y cierre
    df <- closing(df, final_data)  
    })
}