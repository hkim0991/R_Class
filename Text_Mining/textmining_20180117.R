install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("KoNLP")

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(KoNLP)

LETTERS
words <- c(LETTERS)
freq <- c(1:26)
wordcloud(words,freq)


words <- c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')
freq <- c(1,1,1,1,1,2,1,1,1)  # 6번째 오는 알파벳은 2번 나온다 > 더 많이 나온 수를 크게 
wordcloud(words,freq)  

words <- c('Goal', 'Data', '차', 'Data', '오렌지', 'Data', 'Goal', '오렌지', 'I')
wordFreq <- table(words)  # table 함수를 통해 이미 빈도수에 따른 dataframe형태로
sort(wordFreq, decreasing=T)로 #는 큰 수대로 정렬 decreasing=T (Default은 F)
barplot(wordFreq)

words <- c('Goal', 'Data', '차', 'Data', '오렌지', 'Data', 'Goal', '오렌지', 'I',
           '오렌지1', 'I1', '오렌지2', 'I2','오렌지3', 'I1', '오렌지4', 'I2')
wordFreq <- table(words)
sort(wordFreq, decreasing=T)
barplot(wordFreq)
barplot(wordFreq, las=2)


text = "텍스트마이닝은 자연어(natural language)로 구성된 비정형 텍스트 데이터에서
패턴 또는 관계를 추출하여 가치와 의미 있는 정보를 찾아내는 마이닝 기법이다.
(나) 자연어 처리(natural language processing)기술에 기반한 방법이다.
텍스트마이닝은 말 그대로 텍스트 형태의 비정형 데이터에 마이닝 기법을 적용한 것이다. 즉 텍스트에 나타나
는 단어를 분해, 정제하고, 특정 단어의 출현빈도 등을 파악하여 단어들 간의 관계를 조사하는 기법이다.
데이터마이닝은 대규모 DB에 저장된 정형화된 데이터로부터 정보를 찾아내는 기법이라면 텍스트마이닝은 비정
형화된 텍스트 문서에서 정보를 찾아내는 기법이라고 할 수 있다."
useSejongDic()

nouns <- extractNoun(text)

nouns <- nouns[nchar(nouns) >= 2]
nouns <- gsub("텍스트마이닝.*", "텍스트마이닝", nouns)
nouns <- gsub("데이터마이닝.*", "데이터마이닝", nouns)
nouns <- gsub("\\(natural", " ", nouns) 
nouns

wordFreq <- table(nouns)
wdF <- sort(wordFreq, decreasing=T)
wdF

pal <- brewer.pal(6, 'Dark2')

windowsFonts(malgun=windowsFont("맑은 고딕"))

set.seed(1000)
wordcloud(words=names(wdF),
          freq=wdF,
          colors=pal,
          min.freq=1,
          random.order=FALSE,
          family="malgun")








