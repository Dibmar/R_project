# main

# directory set up
directory <- # PATH HERE
  
setwd(directory)

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)


# Debugging and unbugging
debug(skeleton)
skeleton(directory)
undebug(skeleton)
