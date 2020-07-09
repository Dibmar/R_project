#' create_output
#' This function is called by the skeleton function and create the output document 
#' in to Output File
createOutput <-  function(output, config, path){
    
  nameOutput <- paste0(path, "output/Russia2004.csv")
    
    tryCatch(expr = {
      
      write.csv(output, file = nameOutput, 
                row.names = FALSE)
      
    }, error = function(e){
      
      logerror("Saving failed!", logger = 'log')
      stop()
    })
    
}
