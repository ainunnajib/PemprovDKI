#ui.R
fluidPage(
  # Application title
  titlePanel("Word Cloud - RAPBD Pemprov DKI Jakarta"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)
