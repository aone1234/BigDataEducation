# 웹 크롤링
# 1 : 교보문고 주간 베스트셀러

# R 패키지 설치
# httr 패키지(GET), rvest 패키지(read_html())

install.packages("httr")
install.packages("rvest")

library(httr)
library(rvest)

# GET 함수로 서버에 정보 요청하기.
url <- "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?orderClick=d79"

# 위 URL에 있는 html코드를 가져와야함.
# 1) GET 함수 이용하여 서버에 요청.
# 2) read_html()함수 이용하여 html 코드 읽어들임.
data <- GET(url)
data

my_html <- read_html(data, encoding = "EUC-KR")
my_html

# 원하는 정보인 '주간베스트셀러 도서', 개발자도구로 확인
# <strong>태그로 감싸서 있음.
pick1 <- html_nodes(my_html, 'strong')
View(pick1)

# 책제목 뿐만아니라 많은 정보들이 불러와짐.
# strong태그를 a태그가 감싸고 있었음.
pick1 <- html_nodes(my_html, 'a strong')
pick1

# title 클래스 이름인 a 태그인의 strong태그 추출
pick1 <- html_nodes(my_html, '.title a strong')
pick1

# 태그를 제거하고 텍스트만 가져옴. html_text()사용
result <- html_text(pick1)
result

#-------------------------------------------------------------------------------
# 웹 크롤링2 : 멜론 차트 순위 - top 10곡 리스트 가져오기

library(httr)
library(rvest)

url <- "https://www.melon.com/chart/index.htm"

# GET함수 이용하여 서버에 정보 요청
get_url <- GET(url)
get_url

# 인코딩 방식4 utf-8
# read_html() 이용하여 html코드 읽어옴
my_html <- read_html(get_url, encoding = "utf-8")
my_html

# 개발자도구로 1위 제목을 확인
# a태그로 감싸져 있음. 일단 a태그를 전부 가져옴
pick1 <- html_nodes(my_html, "a")
pick1

# a태그는 span태그 하위에 있고, span태그는 다시 div태그 하위에 있음. 
# div 태그에는 class 속성값 ellipsis rank01이라는 클래스가 있음.
pick1 <- html_nodes(my_html, ".ellipsis.rank01")
pick1

# a태그만 추출
pick2 <- html_nodes(pick1, "a")
pick2

# a태그의 내용만 추출, trim 옵션을 TRUE
pick3 <- html_text(pick1, trim = TRUE)
pick3

#-------------------------------------------------------------------------------
# 웹 크롤링3 : 네이버 영화 순위

library(httr)
library(rvest)

# 네이버에 박스오피스라고 검색

url <- "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%B0%95%EC%8A%A4+%EC%98%A4%ED%94%BC%EC%8A%A4"

get_url <- GET(url)
get_url

my_html <- read_html(get_url, encoding = 'utf-8')
my_html

# 개발자 도구를 이용하여 1위 제목에 접근
# div태그의 class 속성값 title_box을 추출
pick1 <- my_html %>% html_nodes(".title_box")
pick1

# 태그의 내용만 추출
pick1 <- my_html %>% html_nodes(".title_box") %>% html_text(trim=TRUE)
pick1



































