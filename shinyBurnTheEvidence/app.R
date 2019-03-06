# This is a Shiny app to create a simple set up for use in WKFORBIAS. 
# To run it, use the command runShiny() in R. 
# Assumes shiny package is installed.


#this sets the path to the directory where this code is

if (!require('rstudioapi')) install.packages('rstudioapi')
library(rstudioapi)

#this sets the path to the source file location
path <- rstudioapi::getActiveDocumentContext()$path
Encoding(path) <- "UTF-8"
setwd(dirname(path))




# Run the application
shinyApp(ui = ui, server = server)


