# This is a Shiny app to create a simple set up for use in WKFORBIAS.
# To run it, use the command runShiny() in R.
# Assumes shiny package is installed.

# Shiny user interface
ui <- navbarPage(strong("WKFORBIAS Set Up"),
                 
                 tabPanel('Welcome', 
                          verticalLayout(
                            hr(),
                            tags$h1(
                              HTML(paste("Welcome to the ", tags$span(style="color:blue", "Woods Hole SimThing"), " Shiny App", sep = ""))
                            ),
                            hr(),
                            h4("blah blah"),
                            br(),
                            p(stringi::stri_rand_lipsum(1)),
                            br(),
                            p(stringi::stri_rand_lipsum(1, start_lipsum = FALSE)),
                            br(),
                            h4("yada yada"),
                            p(stringi::stri_rand_lipsum(1, start_lipsum = FALSE)),
                            br(),
                            p(stringi::stri_rand_lipsum(1, start_lipsum = FALSE))
                          )
                 ),   
                 
                 
                 tabPanel("Use",
                          verticalLayout(                          
                            radioButtons("use", label = h3("Choose Desired Use for SimThing"),
                            choices = list("Test Assessment Model" = "1",                                             "Test Environmental Driver in Assessment Model" = "2",                                 "Test Harvest Control Rule" = "3"), selected = "3"),
                            hr(),
                            fluidRow(column(3, verbatimTextOutput("value"))),
                            
                            conditionalPanel(condition = "input.use == '1'", 
                              fileInput("assmtFile", "Choose Assessment File", multiple = FALSE, accept = "text/plain", placeholder = "No file selected")
                            )             
                            
                          )
                          
                 ),
                            
                            
                            
                 tabPanel("Dimensions",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("year1",
                                          "First Year",
                                          choices = c(1900:2020),
                                          selected = 1991),
                              
                              sliderInput("nyears",
                                          "Number of Years",
                                          min = 5,
                                          max = 100,
                                          value = 20),
                              
                              sliderInput("nages",
                                          "Number of Ages",
                                          min = 4,
                                          max = 50,
                                          value = 10),
                              
                              checkboxInput("plusgroupflag",
                                            "Last Age a Plus Group?",
                                            value = TRUE),
                              
                              sliderInput("nindices",
                                          "Number of Indices",
                                          min = 1,
                                          max = 4,
                                          value = 2)
                            ),
                            mainPanel(
                              plotOutput("dimPlot")
                            )
                          )
                 ),
                 
                 tabPanel("M",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("Mopt",
                                          "Natural Mortality",
                                          choices = list("Single Value", "Constant over Time", "Matrix"),
                                          selected = "Single Value"),
                              
                              sliderInput("Mbase",
                                          "Base Natural Mortality Rate",
                                          min = 0.01,
                                          max = 0.90,
                                          step = 0.01,
                                          value = 0.2),
                              
                              checkboxInput("Merrorflag",
                                            "Add variability to M matrix?",
                                            value = FALSE),
                              
                              sliderInput("Msigma",
                                          "Sigma for added error to M matrix",
                                          min = 0,
                                          max = 1,
                                          step = 0.01,
                                          value = 0)
                            ),
                            mainPanel(
                              plotOutput("Mplot")
                            )
                          )
                 ),
                 
                 tabPanel("F",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("Fyears",
                                          "Years for Setting F (in addition to first and last year)",
                                          min = 1,
                                          max = 10,
                                          step = 1,
                                          value = c(4,5)),
                              
                              sliderInput("Fages",
                                          "Ages for Setting F (in addition to first and last age)",
                                          min = 1,
                                          max = 10,
                                          step = 1,
                                          value = 3),
                              
                              fluidRow(
                                column(4,
                                       sliderInput("Fy1a1", "Fy1a1",
                                                   min = 0, max = 1, step = 0.1, value = 0.1),
                                       sliderInput("Fy2a1", "Fy2a1",
                                                   min = 0, max = 1, step = 0.1, value = 0.1),
                                       sliderInput("Fy3a1", "Fy3a1",
                                                   min = 0, max = 1, step = 0.1, value = 0.1),
                                       sliderInput("Fy4a1", "Fy4a1",
                                                   min = 0, max = 1, step = 0.1, value = 0.1)),
                                column(4,
                                       sliderInput("Fy1a2", "Fy1a2",
                                                   min = 0, max = 1, step = 0.1, value = 0.4),
                                       sliderInput("Fy2a2", "Fy2a2",
                                                   min = 0, max = 1, step = 0.1, value = 0.6),
                                       sliderInput("Fy3a2", "Fy3a2",
                                                   min = 0, max = 1, step = 0.1, value = 0.7),
                                       sliderInput("Fy4a2", "Fy4a2",
                                                   min = 0, max = 1, step = 0.1, value = 0.3)),
                                column(4,
                                       sliderInput("Fy1a3", "Fy1a3",
                                                   min = 0, max = 1, step = 0.1, value = 0.4),
                                       sliderInput("Fy2a3", "Fy2a3",
                                                   min = 0, max = 1, step = 0.1, value = 0.6),
                                       sliderInput("Fy3a3", "Fy3a3",
                                                   min = 0, max = 1, step = 0.1, value = 0.5),
                                       sliderInput("Fy4a3", "Fy4a3",
                                                   min = 0, max = 1, step = 0.1, value = 0.2))
                              )
                            ),
                            mainPanel(
                              tableOutput("Ftable")
                            )
                          )
                 ),
                 
                 tabPanel("WAA",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("Winfyear1",
                                          "Winfinity in first year",
                                          min = 1,
                                          max = 100,
                                          step = 1,
                                          value = 10),
                              sliderInput("Kyear1",
                                          "K in first year",
                                          min = 0.1,
                                          max = 0.9,
                                          step = 0.05,
                                          value = 0.3)
                            ),
                            mainPanel(
                              plotOutput("Wplot")
                            )
                          )
                 ),
                 
                 navbarMenu("Indices",
                            tabPanel("Index 1",
                                     sidebarLayout(
                                       sidebarPanel(
                                         sliderInput("i1A50",
                                                     "Index 1 A50",
                                                     min = 0,
                                                     max = 50,
                                                     step = 0.1,
                                                     value = 4),
                                         
                                         sliderInput("i1slope",
                                                     "Index 1 slope",
                                                     min = -10,
                                                     max = 10,
                                                     step = 0.1,
                                                     value = 1),
                                         
                                         sliderInput("i1A502",
                                                     "Index 1 A50 2",
                                                     min = 0,
                                                     max = 50,
                                                     step = 0.1,
                                                     value = 10),
                                         
                                         sliderInput("i1slope2",
                                                     "Index 1 slope 2",
                                                     min = -10,
                                                     max = 10,
                                                     step = 0.1,
                                                     value = 0),
                                         
                                         sliderInput("i1q",
                                                     "Index 1 catchability",
                                                     min = 0.01,
                                                     max = 1,
                                                     step = 0.01,
                                                     value = 0.3)
                                       ),
                                       mainPanel(
                                         plotOutput("indexplot")
                                       )
                                     )
                            )
                 ),
                 
                 tabPanel("Recruits",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("R0",
                                          "Unexploited recruitment (millions)",
                                          min = 1,
                                          max = 100,
                                          step = 1,
                                          value = 14),
                              
                              sliderInput("steepness",
                                          "Steepness of Bev-Holt curve",
                                          min = 0.21,
                                          max = 1,
                                          step = 0.01,
                                          value = 0.7),
                              
                              sliderInput("Rsigma",
                                          "Sigma for error about SR curve",
                                          min = 0,
                                          max = 2,
                                          step = 0.1,
                                          value = 0),
                              
                              checkboxInput("Rsigmabiasflag",
                                            "Bias adjust recruitment values?",
                                            value = FALSE)
                            ),
                            mainPanel(
                              plotOutput("Recruitmentplot"),
                              plotOutput("Nyear1plot")
                            )
                          )
                 ),
                 
                 tabPanel("Download",
                          sidebarLayout(
                            sidebarPanel(
                              downloadButton("downloadinput", "Download Shiny input"),
                              downloadButton("downloadoutput", "Download Shiny output")
                            ),
                            mainPanel(
                            )
                          )
                 )
)
