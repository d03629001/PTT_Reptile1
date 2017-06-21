## Merge
install.packages("XLConnect")
install.packages("Rwordseg", repos="http://R-Forge.R-project.org")  
install.packages("rJava")
library(XLconnect)
library(tm)
library(tmcn)
library(rJava)
library(Rwordseg)

## GEt all file set in database
setwd("C:/Users/william4ntu/Desktop/Reptile4")
d.corpus<-Corpus(DirSource("C:/Users/william4ntu/Desktop/Reptile4"),list(language=NA))

## remove Punctuation and numbers
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)

## Remove english charater
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

## check for d.corpus
save(d.corpus,files="test.txt")
write(d.corpus,"C:/Users/william4ntu/Desktop/Reptile4/test.txt")
str(d.corpus)

## Search common words from Dictionary(sogou)
words <- readLines("C:/Users/william4ntu/Desktop/Reptile4/dict/animals.txt")
words <- toTrad(words)
insertWords(words)

## word separation for database
d.corpus <- tm_map(d.corpus[1:100], segmentCN, nature = TRUE)
d.corpus <- tm_map(d.corpus, function(sentence) {
  noun <- lapply(sentence, function(w) {
    w[names(w) == "n"]
  })
  unlist(noun)
})
d.corpus <- Corpus(VectorSource(d.corpus))

## Delete unused word
myStopWords <- c(stopwordsCN(), "編輯", "時間", "標題", "發信", "實業", "作者")
d.corpus <- tm_map(d.corpus, removeWords, myStopWords)

## check top 20 common words
head(myStopWords, 20)

## Setup  TermDocumentMatrix
tdm <- TermDocumentMatrix(d.corpus, control = list(wordLengths = c(2, Inf)))

## Top page with 20 hits words
inspect(tdm[1:20, 1:5])

## Draw wordcloud
library(wordcloud)
m1 <- as.matrix(tdm)
v <- sort(rowSums(m1), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)
wordcloud(d$word, d$freq, min.freq = 10, random.order = F, ordered.colors = F, colors = rainbow(length(row.names(m1))))

## search for word wanted word from which websitePTT
d.dtm <- DocumentTermMatrix(d.corpus, control = list(wordLengths = c(2, Inf)))
inspect(d.dtm[1:10, 1:2])

## search for top 30 popular words
findFreqTerms(d.dtm, 30)

## Search for most word (0.5) related with '買賣'
findAssocs(d.dtm, "買賣", 0.5)

