Sys.setlocale('LC_CTYPE', 'en_US.UTF-8')
library(shiny)
library(httr)
library(data.table)
load("DPRDonly.RData")

shinyServer(function(input, output) {
  filter <- reactive({ input$filter })
  
  output$table <- renderDataTable({
    data <- DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]
    if (input$Komisi != "All"){
      data <- data[Komisi == input$Komisi]
    }
    if (input$SKPD != "All"){
      data <- data[SKPD == input$SKPD]
    }
    #data[ , Perubahan.Baru := gsub(' ', '#', Perubahan.Baru)]
    #data[ , PembahasanDPRD.Tambah.P := gsub(' ', '#', PembahasanDPRD.Tambah.P)]
    #data[ , PembahasanDPRD.Kurang.P := gsub(' ', '#', PembahasanDPRD.Kurang.P)]
    #data[ , PembahasanDPRD.Baru.P := gsub(' ', '#', PembahasanDPRD.Baru.P)]
    data
  }
  #, options = list(
  #  columnDefs = list(list(targets = c(3, 4, 5, 6), type = "num-fmt"))
  #)
  )
  
  output$total <- renderText({ 
    data <- DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]
    if (input$Komisi != "All"){
      data <- data[Komisi == input$Komisi]
    }
    if (input$SKPD != "All"){
      data <- data[SKPD == input$SKPD]
    }
    
    format(
      sum(as.numeric(
        gsub('\\.', '', data$PembahasanDPRD.Baru.P)), na.rm = TRUE),
      scientific = FALSE, trim = TRUE, big.mark = "."
    )
  })
    
  datasetInput <- reactive({
    data <- DPRDonly[grep(filter(), Kegiatan, ignore.case = TRUE)]
    if (input$Komisi != "All"){
      data <- data[Komisi == input$Komisi]
    }
    if (input$SKPD != "All"){
      data <- data[SKPD == input$SKPD]
    }
    data
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste0('Delta-2014-P-vs-2014-', filter(), '.csv') },
    content = function(file) {
      write.table(format(datasetInput(), 
                         scientific = FALSE, trim = TRUE, big.mark = "."),
                  file = file, sep = ",", row.names = FALSE, quote = TRUE)
    })
})