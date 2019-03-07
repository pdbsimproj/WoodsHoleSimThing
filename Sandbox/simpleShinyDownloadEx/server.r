# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "orange",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  
    #can't access these outside of this "reactive" function  
  nBin <- input$bins 
  obs <- faithful$eruptions
  wait <- faithful$waiting
  
  faithlist <- list(wait=wait, erupt=obs, nBin=nBin)   
  
   #also need this bit inside the reactive function
  #the extension '.Rlist' is my naming convention
  #the download button won't include that, so you'll have to type it in the 'Save' window
  #regardless of file extension, dput should create the correct structure
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".Rlist", sep="")
    },
    content = function(file) {
      dput(faithlist, file)
    }
  )   
  
  })
  

  

  
  
}

