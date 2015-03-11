library(shiny)
library(data.table)
load("DPRDonly.RData")

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    DPRDonly
  }
  #, options = list(
  #  columnDefs = list(list(targets = c(4, 5, 6, 7), type = "num-fmt"))
  #)
  )
    
  output$downloadData <- downloadHandler(
    filename = 'Delta-2014-P-vs-2014.csv',
    content = function(file) {
      write.table(format(DPRDonly, scientific = FALSE, trim = TRUE, big.mark = "."),
                  file = file, sep = ",", row.names = FALSE, quote = TRUE)
    }
  )
  
})