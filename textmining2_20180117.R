library(wordcloud)
library(KoNLP)

getwd()
setwd("C:\\Users\\ktm\\Documents\\R\\R2_Project\\R_Studio_exercise")
getwd()
ahn = readLines("ahn.txt")
ahn
you = readLines("you.txt")
you

useSejongDic()
mergeUserDic(data.frame("손학규", "ncn"))
mergeUserDic(data.frame("안철수", "ncn"))

is(ahn)
ahn

nouns <- sapply(ahn, extractNoun, USE.NAMES = FALSE)  # USE.NAMES = FALSE ?
nouns
nouns <- unlist(nouns)
nouns <- nouns[nchar(nouns) >=2]
nouns

nouns <- gsub("DA", " ", nouns)
nouns <- gsub("해서", " ", nouns)
nouns <- gsub("하시", " ", nouns)
nouns <- gsub("하기", " ", nouns)
nouns <- gsub("30", " ", nouns)

wFreq <- table(nouns)
wFreq <- sort(wFreq, decreasing=T)
wFreq <- wFreq[1:50]

barplot(wFreq, las=2)

pal <- brewer.pal(6,"Dark2")
windowsFonts(malgun=windowsFont("맑은 고딕"))
set.seed(1000)
wordcloud(words=names(wFreq),
          freq=wFreq,
          colors=pal,
          min.freq=1,
          family="malgun",
          random.order = FALSE)
