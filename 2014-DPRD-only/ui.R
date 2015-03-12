library(shiny)
load("DPRDonly.RData")

shinyUI(
  fluidPage(
    h1("Data tambahan DPRD --- Delta 2014-P vs 2014 (ada di 2014-P namun tidak di 2014) yang kolom Anggaran di 2014-P kosong."),
    fluidRow( textInput("filter", "Filter Kegiatan", value = ""), 
              h4(paste("Total PembahasanDPRD.Baru.P = Rp. "),
                 textOutput("total", inline = TRUE)),
              downloadButton('downloadData', 'Download') ),
    fluidRow(  ),
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)