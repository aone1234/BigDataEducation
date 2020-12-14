# 지도 위에 데이터 표시하기

# 데이터 준비
install.packages("ggmap")
library(ggmap)
library(ggplot2)
register_google(key = "AIzaSyBJ3jQ7O8PXdGbdbCVK2U40Arp6DGkS13k")

head(wind)
dim(wind)

sp <- sample(1:nrow(wind), 50)      # 50개 데이터 샘플링링
sp

df <- wind[sp,]    # 50개의 행을 가지는 데이터 프레임임

cen <- c(mean(df$lon), mean(df$lat))      # 지도의 중심점 계산산
cen

gc <- data.frame(lon=df$lon, lat=df$lat) # 측정 위치 좌표값 데이터(데이터를 표식할 곳)
head(gc)

# 측정 위치에 마커 표시하기
map <- get_googlemap(center = cen, 
                     maptype = "roadmap",
                     zoom = 6,
                     marker = gc)

ggmap(map)

# 풍속을 원의 크기로 표식하기

# 마커없는 지도 가져오기

map <- get_googlemap(center = cen, 
                     maptype = "roadmap",
                     zoom = 6)

ggmap(map)

# 지도를 저장
gmap <- ggmap(map)

# 풍속을 원의 크기로 표시
gmap <- geom_point(data = df,
                   aes(x=lon, y=lat, size=spd),
                   alpha=0.5,      # 투명도
                   col="blue"
                   )
+ scale_size_continuous(range = c(1,14))  # 원의 크기 조절



# 도로교통공단 시도 시군별 월별 교통사고(2018)

ds.tot <- read.csv("도로교통공단_시도_시군구별_월별_교통사고(2018).csv")
ds.tot
ds.seoul <- subset(ds.tot,시도=="서울")
ds.seoul

?aggregate
# aggregate() : 그룹별로 통계 적용하기
# 기준열로 그룹화하여 특정열에 대한 요약 통계
# (max,min,mean,median,sum)를 적용한 값 반환하는 함수.
# aggregate(data, by='기준이 되는 컬럼', FUN)

ds.year <- aggregate(ds.seoul[,'발생건수'], 
                     by = list(시군구=ds.seoul$시군구), 
                     FUN = sum
                     )

gc <- geocode(enc2utf8(as.vector(ds.year$시군구)))

cen <- colMeans(as.matrix(gc))
cen


map <- get_googlemap(center = cen,
                     size = c(640,640),
                     zoom = 11,
                     maptype = "roadmap")
# 지도 출력
ggmap(map)

gmap + 
       geom_point(data = data.frame(gc),
                  aes(x=lon, y=lat, size=ds.year$x),
                  alpha=0.5,
                  col = "red") +
                  scale_size_continuous(range = c(1,14))


# 구글 지도 API키 설정
register_google(key = "AIzaSyBJ3jQ7O8PXdGbdbCVK2U40Arp6DGkS13k")


# 경도와 위도를 중심 지도정보 생성
map <- get_googlemap(center = c(126.9736984,37.5722119), 
                     maptype = "roadmap", zoom = 17, size = c(320,320))

# 지도 출력
ggmap(map)

# 지도 여백설정(여백이 없는 상태)
ggmap(map, extent = "device")

#------------------------------------------------------------------------------
# 주소 이용 지도 출력

# 지역명에 대한 경도, 위도 생성
# 한글 지역명 : 


gc <-  geocode(enc2utf8("호미곶"))
# 경도와 위도 출력








#-----------------------------------------------------------------------------

# 단양팔경을 지도 위에 표시 => 관광안내 지도
# 지명 : 도담상봉 / 석문, 구담봉 / 옥순봉, 사인암, 하선암, 중선암, 상선암
# 1) 구글 지도 API정보 설정
# 2) 단양팔경 지역명 / 주소 설정
# 3) 단양팔경 위도/경도 검색 : geocode()
# 4) 지도 중심좌표 설정
# 5) 구글 지도정보 생성 : get_googlemap()
# 6) 지도 출력 : ggmap()
# 7) 지역명 출력 : geom_text()

# 패키지 설치 및 로딩
library(ggplot2)
library(ggmap)

register_google(key = "AIzaSyBJ3jQ7O8PXdGbdbCVK2U40Arp6DGkS13k")

# 지역명
names <- c("도담상봉 / 석문", "구담봉 / 옥순봉", "사인암", 
           "하선암", "중선암", "상선암")

# 주소
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암 2길 42",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")
        
# 주소지의 위도 경도
gc <- geocode(enc2utf8(addr))  

# 단양팔경 이름, 경도, 위도
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)

cen <- c((max(df$lon) + min(df$lon)) / 2, 
         (max(df$lat) + min(df$lat)) / 2)

# 지도 정보 생성
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 12,
                     marker = gc)

# 지도 출력
ggmap(map)


# 지도 위에 지역명 출력
gmap + geom_text(data = df,
                 aes(x=lon, y=lat),       # 위치설정
                 size=5,                  # 출력문자 크기
                 label=df$name)           # 출력문자자


# 한해동안 발생한 우리나라 지진발생 데이터을 
#   이용해서 지도로 표시하고 분보를 파악 해 보자
 
# 1) 구글 지도 API정보 설정 : register_google()
# 2) 지진 데이터 세트 읽기 : read.xlsx()
# 3) 데이터 정제
# 4) 지도 중심좌표 설정 : geocode()
# 5) 구글 지도 정보 생성 : get_googlemap()
# 6) 지도 출력 : ggmap()
# 7) 지진 규모 출력 : geom_poit()

library(ggmap)
library(ggplot2)

register_google(key = "AIzaSyBJ3jQ7O8PXdGbdbCVK2U40Arp6DGkS13k")

df2 <- X2020
df
head(df)
tail(df)

df2 <- data.frame(lon = df[,6], lat = df[,5], mag = df[,3])
View(df2)

# 데이터 정제 : 엑셀시트원본에 있는 위도 숫자 뒤의 "N"제거, 경도숫자의 "E"제거
df[,1] <- gsub(" E","",df[,1])
df[,2] <- gsub(" N","",df[,2])

str(df2)

install.packages("writexl")
library(writexl)
write_xlsx(df2, path = "df2.xlsx")

# Factor로 되어 있는 데이터 유형을 계산이 가능한 숫자형으로 변환

df2[,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))
df2[,3] <- as.numeric(as.character(df2[,3]))
str(df2)



# 지도 중심 좌표 설정
cen <- c((max(df2$...6)+min(df2$...6))/2,
         (max(df2$...5)+min(df2$...5))/2)
cen

# 지도 정보 생성

map <- get_googlemap(center = cen, zoom = 6)

# 지도출력
gmap <- ggmap(map)

# 지도 위에 점(도형) 표시
gmap + geom_point(data = df2,
                  aes(x=...6, y=...5),
                  color="red",
                  size = df2$...3,
                  alpha = 0.5)

























































