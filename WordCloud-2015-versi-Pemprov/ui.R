#ui.R
fluidPage(
  # Application title
  titlePanel("Word Cloud - RAPBD Pemprov DKI Jakarta"),
  
  sidebarLayout(
    sidebarPanel(
#      numericInput("budget", "Minimum Total Budget containing the word (juta):", value = 100, min = 0, step = 100),
      sliderInput("budget",
                  "Minimum Total Budget containing the word (juta):",
                  min = 1,  max = 1000000, value = 100),
      sliderInput("max",
                  "Maximum Number of Words to be shown:",
                  min = 1,  max = 300,  value = 300)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)
