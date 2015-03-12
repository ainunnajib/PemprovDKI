library(shiny)
load("DPRDonly.RData")

shinyUI(
  fluidPage(
    tags$head(includeScript("google-analytics.js")),
    h1("Data tambahan DPRD --- Delta 2014-P vs 2014 (ada di 2014-P namun tidak di 2014) yang kolom Anggaran di 2014-P kosong."),
    
    fluidRow(
      column(4, 
             selectInput("Komisi", 
                         "Komisi:", 
                         c("All", 
                           unique(as.character(DPRDonly$Komisi))))
      ),
      column(4, 
             selectInput("SKPD", 
                         "SKPD:", 
                         c("All", 
                           unique(as.character(DPRDonly$SKPD))))
      )
    ),
    
    fluidRow( textInput("filter", "Filter Kegiatan", value = ""), 
              h4(paste("Total PembahasanDPRD.Baru.P (sesuai filter) = Rp. "),
                 textOutput("total", inline = TRUE)),
              downloadButton('downloadData', 'Download') ),
    fluidRow(  ),
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)