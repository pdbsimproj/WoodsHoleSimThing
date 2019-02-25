source("ui.r")
source("server.r")


# Run the application 
#shinyApp(ui = ui, server = server)

runApp(appDir = getwd(), display.mode = "showcase")
