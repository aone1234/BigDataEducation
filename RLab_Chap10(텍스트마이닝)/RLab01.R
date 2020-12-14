# DTM(Document Term Matrix):
# 문서를 벡터로 변환하는 기술.

# 위키피디아의 "data science" 문서로 테스트

# RCurl : 웹서버에 접속시 사용하는 라이브러리
install.packages("RCurl")
library(RCurl)

# XML 라이브러리로 웹 문서 처리
install.packages("XML")
library(XML)

# readLines() : 지정된 URL에서 html파일을 읽어옴.
t <- readLines('https://en.wikipedia.org/wiki/Data_science')
d <- htmlParse(t, asText = TRUE)

# 웹문서를 R의 데이터 형으로 변환해줌.
clean.doc <- xpathSApply(d, "//p", xmlValue)

# 전처리
# tm 라이브러리 : 데이터 마이닝 함수 제공.
# SnowballC 라이브러리 : 어간을 추출하는 함수 제공.
install.packages("tm")
library(tm)

install.packages("SnowballC")
library(SnowballC)

doc <- Corpus(VectorSource(clean.doc))
inspect(doc)


# tm_map() : 지정된 매개변수값에 따라 전처리
doc <- tm_map(doc, content_transformer(tolower))
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, removeWords, stopwords('english'))
doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, stripWhitespace)

dtm <- DocumentTermMatrix(doc)
dim(dtm)

# inspect() : 상세 내용 요약해서 보여줌
inspect(dtm)

# 단어 구름 (word cloud) : 2차원 공간에 표시하는 가시화 기법
install.packages("wordcloud")
library(wordcloud)

# as.matrix() : DTM을 행렬 표현으로 변환
m <- as.matrix(dtm)

# 빈도(중요도)가 높은 순서로 단어를 정렬렬
v <- sort(colSums(m), decreasing = TRUE)

d <- data.frame(word = names(v), freq = v)

wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 200, 
          random.order = FALSE , rot.per = 0.50, colors = palette()) 
install.packages("wordcloud2")          
library(wordcloud2)

# wordcloud2 : 자동으로 색상 입혀주고, 단어를 다양한 방향으로 배치 해 줌.
wordcloud2(d)

d1 <- d[1:200,]       # 200개 단어만 표시

# 배경모양
wordcloud2(d1, shape = 'star')

# 단어방향 범위 지정
wordcloud2(d1, minRotation = pi/4, maxRotation = pi/4, rotateRatio = 1.0)

# 상위 12개 단어만 표시하라는 옵션
findFreqTerms(dtm, lowfreq = 12)

barplot(d[1:10, ]$freq, names.arg = d[1:10, ]$word, col = 'lightblue', 
        main = '발생 빈도 상위 단어', ylab = '단어빈도')

install.packages("gapminder")
library(gapminder)
View(gapminder)

library(dplyr)

pop_siz <- gapminder %>% 
           filter(year == 2007) %>% 
           group_by(continent) %>% 
           summarise(sum(as.numeric(pop)))

d <-  data.frame(word = pop_siz[,1], freq = pop_siz[,2])
wordcloud(words = d[,1], freq = d[,2], min.freq = 1, 
          max.words = 100, ramdom.order = FALSE, ror.per = 0.35)

wordcloud2(d)



































