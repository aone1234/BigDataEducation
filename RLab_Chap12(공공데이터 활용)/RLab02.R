
# 지역별 미세먼지 농도 비교 : 지도
# 지도에서 원의 크기는 각 지역별 농도 크기 표시한 것임.
# 1) 대기오염 정보조회 API 설정
# 2) URL 작성
# 3) 실시간 시도별 평균 정보 조회 API 호출 : xmlparse()
# 4) 미세먼지 데이터 프레임 변환 : xmlToDataFrame()
# 5) 구글 지도 API키 설정 : register_google()
# 6) 지역별 좌표 검색 : geocoding()
# 7) 지도 중심좌표 설정 : geocoding()
# 8) 구글 지도 정보 생성 : get_googlemap()
# 9) 지도 출력 : ggplot() + geom_plot()


# 미세먼지 XML 문서 출력
library(XML)
library(ggplot2)
library(ggmap)

api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"

api_key <- "fk%2F7isA3q6Hg9b4GE51v0hUpxtuhVgo6piScar1n%2BB%2Bm8uzvOw6DIW0lEgIgk54ZxVDQ4rohTF%2Bz4%2FvTznjbRA%3D%3D"

numOfRows <- 10

# 출력할 페이지 번호
pageNo <- 1

# 아이템 코드 : 미세먼지
itemCode <- "PM10"

# 미세먼지의 시간 단위 평균
dataGubun <- "HOUR"

# 요청 데이터 기간 : 한달간 
searchCondition <- "MONTH"

# URL 작성
# API에 매개변수 = 매개 변수값을 전달.
# 첫번째 매개변수 앞에서는 '?', 두번째부터는 '&'로 구분.
url <- paste(api,
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition,
             sep = "")

xmlFile <- xmlParse(url)
xmlFile


#-------------------------------------------------------------------------------

# 특정 시간대의 지역별 미세먼지 농도 추출
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
df

pm <- df[1, 4:20]
pm

# 지역별 미세먼지 농도의 지도 출력
register_google(key = "AIzaSyBwjleoQo7y0Yqzf2CskzvCllvdQtqQvnM")

cities <- c("서울시", "부산시", "대구시", "인천시", "광주시", "대전시", "울산시",
            "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", 
            "경상북도", "경상남도", "제주시", "세종시")

# 지역별 좌표검색 (위도, 경도)
gc <- geocode(enc2utf8(cities))
gc

# 지역별 미세먼지 정보의 데이터프레임
df2 <- data.frame(지역명 = cities,
                  미세먼지 = t(pm),
                  경도 = gc$lon,
                  위도 = gc$lat,
                  stringsAsFactors = F)
df2

# 두번째 열이름을 "미세먼지"로 변경
names(df2)[2] <- "미세먼지"

str(df2)

# 지도에 원의 크기에 반영하기 위해
# 미세먼지의 데이터 유형을 숫자형으로 변환
df2[,2] <- as.numeric(df2[,2])

# 지도 중심 좌표 설정
cen <- as.numeric(geocode(enc2utf8("전라북도")))

# 구글지도 정보생성
map <- get_googlemap(center = cen, zoom = 7)

# 지도 출력
ggmap(map) +                            # 지도 출력
             geom_point(data = df2,
             aes(x=경도, y=위도),
             color=rainbow(length(df2$미세먼지)),
             size=df2$미세먼지*0.3,
             alpha=0.5)















































