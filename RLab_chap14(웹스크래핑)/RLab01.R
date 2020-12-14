#  웹크로링(Web crawling) : 포털 등에서 자동으로 웹 사이트의 
#                           링크 정보를 수집하여 저장하는 기술

#  웹 스크래핑 (Web scraping) : 웹 사이트로부터 웹문서를 다운로드 
#                               받아 필요한 정보를 추출하는 기술.

# R(데이터 추출) <===== 웹 사이트(웹문서) : HTML

# 브라우저가 HTML문서를 파싱하여 브라우저의 도규먼트 영역에 랜더링 할때 
# HTML 문서를 구성하는 모든 태그와 속성, 콘텐츠들을 DOM(Document Object Model)
# 이라는 규격을 적용하여 JavaScript 객체를 생성함.
  
# DOM : 구조화된 문서의 표현 형식.
# 프로그래밍 언어가 특정 부분에 쉽게 접근할 수 있도록 함.

# 오픈 API 목록 아이템 
# 오픈 API 목록 아이템 설명

# DOM 구조
# Element <html>
#      |
#      |-------- Element <head>
#      |-------- Element <body>
#                          |
#                          |-------- Element <div>
#                                       |
#                                       |-----<ul>
#                                              |
#                                              |------<li>
#                                                      |
#                                                      |------ Element <span> -------- Attribute
#                                                                                      class="title" : 오픈 API 목록 아이템 제목
 
# 공공데이터 포털의 목록 추출
install.packages("rvest")
library(rvest)

# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"

# read_html() : 웹문서 읽기 ==> XML 문서(디폴트)
html <- read_html(url)

# 목록 아이템 추출
# html_text() : html문서에서 노드내의 데이터 추출
title <- html_nodes(html, "#apiDataList .title") %>% 
  html_text()

# 목록 아이템 설명 추출
desc <- html_nodes(html, "#apiDataList .ellipsis") %>% 
  html_text()

# 데이터 정제 : 제어문자를 공백으로 대체
# gsub() : HTML 문서에서 노드 추출
title <- gsub("[|\r|\n|\t]", "", title)

# 데이터 출력
api <- data.frame(title, desc)






























