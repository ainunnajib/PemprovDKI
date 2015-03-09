#pemprov
library(stringr)
library(data.table)
library(dplyr)
library(reshape2)

pemprov <- mata.anggaran[ , .(program = tolower(Program), juta = ceiling(TOTAL/1000000))]
pemprov[ , program := gsub('[^a-zA-Z ]', '', program)]
pemprov[ , program := gsub(' +', ' ', program)]
pemprov[ , words := strsplit(program, ' ')]

# maxwords <- 0
# for(i in 1:nrow(pemprov)) {
#   maxwords <- max(maxwords, length(pemprov$words[[i]]))
# } # = 176

words <- str_split_fixed(pemprov$program, ' ', 176)
words <- data.table(words)
words.anggaran <- cbind(pemprov[ , .(program, juta)], words)
words.anggaran <- melt(words.anggaran, id.vars = c("program", "juta"))
words.anggaran <- words.anggaran %>% arrange(program, variable) %>% filter(value != "")

words <- words.anggaran[ , .(juta = sum(juta)), by = value]
vv <- as.vector(words$juta)
names(vv) <- words$value
