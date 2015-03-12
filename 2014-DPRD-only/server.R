library(shiny)
library(data.table)
load("DPRDonly.RData")

shinyServer(function(input, output) {
  filter <- reactive({ input$filter })
  
  output$table <- renderDataTable({
    DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]
  })
  
  output$total <- renderText({ 
    format(
      sum(as.numeric(
        gsub('\\.', '',
             DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]$PembahasanDPRD.Baru.P)),
        na.rm = TRUE),
      scientific = FALSE, trim = TRUE, big.mark = "."
    )
  })
    
  datasetInput <- reactive({
    DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste0('Delta-2014-P-vs-2014-', filter(), '.csv') },
    content = function(file) {
      write.table(format(datasetInput(), 
                         scientific = FALSE, trim = TRUE, big.mark = "."),
                  file = file, sep = ",", row.names = FALSE, quote = TRUE)
    })
})