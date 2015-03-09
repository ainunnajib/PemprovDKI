#server.R
library(tm)
library(wordcloud)
library(memoise)
library(shiny)

function(input, output, session) {

  # text <- readLines("textonly", encoding="UTF-8")
  # myCorpus = Corpus(VectorSource(text))
  # myCorpus = tm_map(myCorpus, content_transformer(tolower))
  # myCorpus = tm_map(myCorpus, removePunctuation)
  # myCorpus = tm_map(myCorpus, removeNumbers)
  # myCorpus = tm_map(myCorpus, removeWords, "dan")
  # myDTM = TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
  # m = as.matrix(myDTM)
  # v <<- sort(rowSums(m), decreasing = TRUE)
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    load("vv.RData")
    wordcloud_rep(names(vv), vv, scale=c(4, 0.5),
                  min.freq = input$budget, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}
