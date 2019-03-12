# This is a Shiny app to create a simple set up for use in WKFORBIAS.
# To run it, use the command runShiny() in R.
# Assumes shiny package is installed.

# Shiny server
source('addLognormalError.R')
source('calcEquilibriumPop.R')
source('calcAggregateBiomass.R')
server <- function(input, output, session) {
  

  

  vals <- reactiveValues()
  observe({
    if (is.null(input$assmtFile)==FALSE){
    vals$name <- input$assmtFile$datapath
    vals$values <- dget(input$assmtFile$datapath)
    print(vals$values$parms$nages)
    }
  })
  

  
  
  
  observe({
     year1 <- ifelse(is.null(input$assmtFile),as.numeric(input$year1), vals$values$parms$styr)
    print(year1)
    nyears <- input$nyears
    year2 <- year1 + nyears - 1
    updateSliderInput(session, "Fyears", 
                      value = c((year1 + floor(nyears / 3)), (year1 + ceiling(2 * nyears / 3))),
                      min = year1, max = year2, step = 1)
  })
  
  observe({
    nages <- input$nages
    updateSliderInput(session, "Fages", value = floor(nages/2),
                      min = 1, max = nages, step = 1)
  })
  
  years <- reactive({
    yr1 <- as.numeric(input$year1)
    seq(yr1, yr1 + input$nyears - 1)
  })  
  
  ages <- reactive({
    seq(1, input$nages)
  })
  
  Mlist <- reactive({
    M <- list()
    M$base <- matrix(input$Mbase, nrow=input$nyears, ncol=input$nages, dimnames=list(years()))
    M$values <- M$base
    M$Merrorflag <- input$Merrorflag
    if(input$Merrorflag == TRUE){
      M$noise <- addLognormalError(M$base, input$Msigma, biasadjustflag = FALSE, randomval = NULL)
      M$values <- M$noise
    }
    dput(M, "M.Rlist")
    M
  })
  
  Flist <- reactive({
    FAA <- list()
    year1 <- as.numeric(input$year1)
    nyears <- input$nyears
    nages <- input$nages
    y1 <- 1
    y2 <- input$Fyears[1] - year1 + 1
    y3 <- input$Fyears[2] - year1 + 1
    y4 <- nyears
    a1 <- 1
    a2 <- input$Fages
    a3 <- nages
    Fg <- matrix(NA, nrow = nyears, ncol = nages)
    Fg[y1,a1] <- input$Fy1a1
    Fg[y1,a2] <- input$Fy1a2
    Fg[y1,a3] <- input$Fy1a3
    Fg[y2,a1] <- input$Fy2a1
    Fg[y2,a2] <- input$Fy2a2
    Fg[y2,a3] <- input$Fy2a3
    Fg[y3,a1] <- input$Fy3a1
    Fg[y3,a2] <- input$Fy3a2
    Fg[y3,a3] <- input$Fy3a3
    Fg[y4,a1] <- input$Fy4a1
    Fg[y4,a2] <- input$Fy4a2
    Fg[y4,a3] <- input$Fy4a3
    if (a2 > (a1+1)){
      for (a in (a1+1):(a2-1)){
        Fg[y1,a] <- Fg[y1,a1] + (a - a1) * (Fg[y1,a2] - Fg[y1,a1]) / (a2 - a1)
        Fg[y2,a] <- Fg[y2,a1] + (a - a1) * (Fg[y2,a2] - Fg[y2,a1]) / (a2 - a1)
        Fg[y3,a] <- Fg[y3,a1] + (a - a1) * (Fg[y3,a2] - Fg[y3,a1]) / (a2 - a1)
        Fg[y4,a] <- Fg[y4,a1] + (a - a1) * (Fg[y4,a2] - Fg[y4,a1]) / (a2 - a1)
      }
    }
    if (a3 > (a2+1)){
      for (a in (a2+1):(a3-1)){
        Fg[y1,a] <- Fg[y1,a2] + (a - a2) * (Fg[y1,a3] - Fg[y1,a2]) / (a3 - a2)
        Fg[y2,a] <- Fg[y2,a2] + (a - a2) * (Fg[y2,a3] - Fg[y2,a2]) / (a3 - a2)
        Fg[y3,a] <- Fg[y3,a2] + (a - a2) * (Fg[y3,a3] - Fg[y3,a2]) / (a3 - a2)
        Fg[y4,a] <- Fg[y4,a2] + (a - a2) * (Fg[y4,a3] - Fg[y4,a2]) / (a3 - a2)
      }
    }
    if (y2 > (y1+1)){
      for (y in (y1+1):(y2-1)){
        for (a in 1:nages){
          Fg[y,a] <- Fg[y1,a] + (y - y1) * (Fg[y2,a] - Fg[y1,a]) / (y2 - y1)
        }
      }
    }
    if (y3 > (y2+1)){
      for (y in (y2+1):(y3-1)){
        for (a in 1:nages){
          Fg[y,a] <- Fg[y2,a] + (y - y2) * (Fg[y3,a] - Fg[y2,a]) / (y3 - y2)
        }
      }
    }
    if (y4 > (y3+1)){
      for (y in (y3+1):(y4-1)){
        for (a in 1:nages){
          Fg[y,a] <- Fg[y3,a] + (y - y3) * (Fg[y4,a] - Fg[y3,a]) / (y4 - y3)
        }
      }
    }
    FAA$Fgrid <- Fg
    df <- data.frame()
    for (y in 1:nyears){
      thisdf <- data.frame(year = as.integer(y + year1 - 1),
                           age = 1:nages,
                           Fval = Fg[y,])
      df <- rbind(df, thisdf)
    }
    FAA$Fdf <- df
    FAA$values <- Fg
    FAA
    dput(FAA, "FAA.Rlist")
  })
  
  Wlist <- reactive({
    W <- list()
    WAA <- input$Winfyear1 * (1 - exp(-input$Kyear1 * seq(1, input$nages))) ^ 3
    W$base <- matrix(rep(WAA, each=input$nyears), nrow=input$nyears, ncol=input$nages)
    W$values <- W$base
    W
    dput(W, "W.Rlist")
  })
  
  indexlist <- reactive({
    index <- list()
    for (ind in 1:input$nindices){
      index[[ind]] <- list()
      if (ind == 1){
        index[[ind]]$A50 <- input$i1A50
        leftc <- 1 / (1 + exp(-input$i1slope * (ages() - input$i1A50)))
        rtc <- 1 / (1 + exp(-input$i1slope2 * (ages() - input$i1A502)))
        index[[ind]]$selx <- leftc * rtc / max(leftc * rtc)
        index[[ind]]$q <- input$i1q
      }
    }
    index
    dput(index, "index.Rlist")
  })
  
  Rlist <- reactive({
    r <- list()
    r$SRcurve <- "BevHolt"
    r$BHR0 <- input$R0
    r$BHsteepness <- input$steepness
    Mvec <- Mlist()$values[1,]  # use first year for calculations
    Wvec <- Wlist()$values[1,]  # use first year for calculations
    N0pr <- calcEquilibriumPop(1, input$nages, Mvec, 0)
    SSB0pr <- calcAggregateBiomass(N0pr, Wvec, Mvec, 0, 0)  # assume SSB at start of year for now
    r$BHSSB0 <- SSB0pr * input$R0
    denom <- 5 * input$steepness - 1
    r$BHalpha <- 4 * input$steepness * input$R0 / denom
    r$BHbeta <- r$BHSSB0 * (1 - input$steepness) / denom
    r
    dput(r, "SR.Rlist")
  })
  
  Ny1list <- reactive({
    Ny1 <- list()
    Ny1$type <- "Equilibrium"
    Ny1$R <- "BevHolt"
    Ny1
    dput(Ny1, "Ny1.Rlist")
  })
  
  output$dimPlot <- renderPlot({
    ya <- expand.grid(Age = ages(), Year = years())
    plot(ya$Age, ya$Year, xlab="Age", ylab="Year")
    title(paste("Number of Indices =", input$nindices))
  })
  
  output$Mplot <- renderPlot({
    matplot(rownames(Mlist()$values), Mlist()$values, xlab="Year", ylab="M", ylim=c(0,max(Mlist()$values)))
  })
  
  output$Ftable <- renderTable({
    Flist()$Fgrid
  })
  
  output$Wplot <- renderPlot({
    matplot(Wlist()$values)
  })
  
  output$indexplot <- renderPlot({
    plot(ages(), indexlist()[[1]]$selx, ylim=c(0,1), xlab="Age", ylab="Selectivity")
  })
  
  output$Nyear1plot <- renderPlot({
    Mvec <- Mlist()$values[1,]
    Fvec <- Flist()$values[1,]
    Wvec <- Wlist()$values[1,]
    NpR <- calcEquilibriumPop(1, input$nages, Mvec, Fvec, input$plusgroupflag)
    SSBpR <- calcAggregateBiomass(NpR, Wvec) # assume SSB at start of year for now
    SSB1 <- Rlist()$BHalpha * SSBpR - Rlist()$BHbeta
    R1 <- Rlist()$BHalpha * SSB1 / (Rlist()$BHbeta + SSB1)
    Nyear1 <- calcEquilibriumPop(R1, input$nages, Mvec, Fvec, input$plusgroupflag)
    Nyear1noise <- addLognormalError(Nyear1, input$Rsigma, input$Rsigmabiasflag)
    if (input$plusgroupflag == TRUE){
      Nyear1noise[input$nages] <- Nyear1[input$nages] # do not apply noise to plus group
    }
    plot(ages(), Nyear1noise, xlab="Age", ylab="Population N in Year 1", ylim=c(0,max(c(Nyear1, Nyear1noise))))
    lines(ages(), Nyear1)
  })
  
  output$Recruitmentplot <- renderPlot({
    ssb <- seq(0, Rlist()$BHSSB0, length.out = 400)
    r <- Rlist()$BHalpha * ssb / (Rlist()$BHbeta + ssb)
    rn <- addLognormalError(r, input$Rsigma, input$Rsigmabiasflag)
    plot(ssb, rn, xlab="SSB", ylab="Recruits (millions)")
    lines(ssb, r)
    title(main = "Demonstration of recruitment variability")
  })
  
  #chris's original code 
  # output$downloadinput <- downloadHandler(
  #   filename = function() {paste0("ShinyInput", Sys.time(), ".DMP")},
  #   content = function(file) {save(input, file=file)}
  # )
  

  
  #Note, these files are assumed to exist; returns an error if they don't;
  #quick and dirty fix is to include them with the code as the default configuration.  If the user modifies any of the tabs then the files will be updated.  Less dirty fix is to find a wrapper that ignores the statement if the files don't exist (perhaps with if (file.exists(...)) as below for mlist)
  if (file.exists("M.Rlist")){
      mlist <- dget("M.Rlist")
  } else {
    mlist <- list(base=0.2)
  }

  wlist <- dget("W.Rlist")    
  faalist <- dget("FAA.Rlist")
  indlist <- dget("index.Rlist")
  srlist <- dget("SR.Rlist")
  
  ShinyList <- list(M=mlist, w=wlist, FAA=faalist, Ind=indlist, SR=srlist)
  
  output$downloadinput <- downloadHandler(
    filename = function() {paste0("ShinyInput", Sys.time(), ".Rlist")},
    content = function(file) {dput(ShinyList, file=file)}
  )
  
  output$downloadoutput <- downloadHandler(
    filename = function() {paste0("ShinyOutput", Sys.time(), ".DMP")},
    content = function(file) {save(output, file=file)}
  )
}



