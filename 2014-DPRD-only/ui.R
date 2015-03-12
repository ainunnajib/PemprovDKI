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
      ),
      column(4, 
             textInput("filter", "Filter Kegiatan", value = "")
      )
    ),
    
    fluidRow( column(8, 
                     h4(paste("Total PembahasanDPRD.Baru.P (sesuai filter) = Rp. "),
                        textOutput("total", inline = TRUE))),
              column(8, downloadButton('downloadData', 'Download')) 
            ),

    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)