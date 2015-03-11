library(shiny)
load("DPRDonly.RData")

shinyUI(
  fluidPage(    
    fluidRow( downloadButton('downloadData', 'Download') ),
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)