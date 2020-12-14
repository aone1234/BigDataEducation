# 네이버 오픈 API
# 네이버에는 뉴스, 쇼핑, 블로그, 카페, 지식iN, 전문자료, 
# 영화, 책 등 다양한 정보 제공하는 메뉴들이 있음.
# 이런 정보들을 쉽게 받아 볼 수 있도록 오픈 API를 제공함.

# API이용 신청 => API이용신청 승인 => API호출 => 결과

# 필요한 패키지
# RCurl : 일반적인 HTTP 요청(다운로드)
# Remcabko : 한글 문장의 형태소 분석
# wordcloud : 워드 클라우드 출력
# XML : 로컬, 웹에 연결된 XML, HTML 문서 읽음.

# 네이버 오픈 API키 발급 받기

# Client ID : QU3fWWEUyS6mDGUeGeY5
# Client Secret : 42BSoS4QPv

# 뉴스검색 : "인공지능 " 키워드

# 1) API 설정
# 2) URL 작성
# 3) 문서 다운로드 : getURL()
# 4) XML 문서 구조로 변환 : xmlparse()
# 5) 뉴스 내용 추출 : xpathSApply()
# 6) 데이터 정제 : gsub()
# 7) 단어 추출 : nouns()
# 8) 단어 빈도 분석 : table()
# 9) 워드 클라우드 출력 : wordcloud()


install.packages("RCurl")
install.packages("XML")
install.packages("wordcloud")
install.packages("RmecabKo")

library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)

# RmecabKo 패키지에서 사용하는 형태소 기본 기능 설치 => 폴더가 자동 생성됨.
install_mecab("C:/Rlibs/mecab")
library(RmecabKo)

# API설정 (뉴스검색 API, 클라이언트 ID, 시크릿)
searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "QU3fWWEUyS6mDGUeGeY5"
Client_Secret <- "42BSoS4QPv"

query <- URLencode(iconv("인공지능", "euc-kr", "UTF-8"))

# URL 작성 (검색 키워드를 "UTF-8"로 암호화 하고 API로 요청할 URL를 만듦. 검색결과는 20개로 요청)
url <- paste(searchUrl, "?query=", query,
             "&display=20", sep = "")

# getURL() : url 문서 다운로드
doc <- getURI(url, httpheader=c('Content-Type'="application/xml",
              'X-Naver-Client-Id'= Client_ID,
              'X-Naver-Client-Secret'= Client_Secret))
doc

# 뉴스 추출 및 단어 간 빈도 비교
# XML 문서구조로 변환
xmlFile <- xmlParse(doc)

# 뉴스 추출
# : XML 문서에 있는 20개의 <item>태그 내에 있는 태그들을 항목명으로 하는 데이터 프레임 생성
df <- xmlToDataFrame(getNodeSet(xmlFile,"//item"))
df

# 뉴스내용
description <- df[,4]

# 뉴스내용 데이터 정제
# 숫자, <b> </b>태그, HTML문서의 끝따옴표(&quot:) => 빈문자열로 대체 
# '|'는 OR 조건
description2 <- gsub("\\d | <b> | </b> | &quot:", "", description)

# 단어추출 : RmecabKo패키지의 nouns()함수 사용
# => 20개의 각 뉴스에 대한 단어 추출결과를 리스트로 나타남.
# iconv() : 문자벡터의 암호화
nouns <- nouns(iconv(description2, "utf-8"))

# 리스트를 벡터 변환
# 각 리스트의 단어들을 하나의 벡터로 통합
# "use.names = F : 뉴스원문을 제외
nouns.all <- unlist(nouns,use.names = F)

# 글자수가 1자 이하인 단어 추출 ==> 분석에서 제외 대상
nouns.all1 <- nouns.all[nchar(nouns.all)<=1]

# 글자수가 2자 이하인 단어 추출 ==> 분석 대상
nouns.all2 <- nouns.all[nchar(nouns.all)>=2]

# 단어빈도
nouns.freq <- table(nouns.all2)

# 단어빈도를 데이터 프레임으로 생성(문자열의 경우, 팩터유형으로 하지 않음.)
nouns.df <- data.frame(nouns.freq, stringsAsFactors = F)

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]

# 단어의 워드 클라우드
wordcloud(nouns.df.sort[,1],            # 단어
          freq = nouns.df.sort[,2],     # 빈도
          min.freq = 1,                 # 최소 단어 빈도
          scale = c(3,0.7),             # 단어 크기 범위
          rot.per = 0.25,               # 회전 비율
          random.order = F,             # 고빈도 단어 중앙배치
          random.color = T,
          colors = rainbow(10)
          )

library(wordcloud2)
wordcloud2(nouns.df)

# 실습
# 네이버 블로그 검색
# 여행에 관한 네이버 블로그를 검색해서 어떤 단어들이 많이 나타나는지 파악해보자.


























































