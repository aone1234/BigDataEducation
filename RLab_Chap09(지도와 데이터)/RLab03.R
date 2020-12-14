# 지도위에 마커와 텍스트 표시
 library("ggmap")
 register_google(key = "AIzaSyBwjleoQo7y0yQzf2CskzvCllvdQtqQvNM")

# 1) 지도의 중심지점에 마커표시
# 지점의 경도와 위도
gc <- geocode(enc2utf8("구미"))

# 경도와 위도를 숫자로
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 13,
                     marker = gc)   # 마커의 위치
ggmap(map)

# 2) 지도의 여러 지점에 마커와 텍스트 표시

library(ggplot2)
names <- c("용두암", "성산일출봉", 
           "정방폭포", "중문관광단지", 
           "한라산 1100고지", "차귀도")

addr <- c("제주시 용두암길15", 
          "서귀포시 성산읍 성산리", 
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산 1-2",
          "제주시 한경면 고산리 125")

# 주소를 경도와 위도로 변환
gc <-  geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)

df

# 지도의 중심점
cen <- c(mean(df$lon), mean(df$lat))
cen

# 지도 형태
map <- get_googlemap(center = cen,
                     maptype = "hybrid",
                     zoom = 10,
                     size = c(640,640),
                     marker = gc
                     )

ggmap(map)

# 명소 이름 지도위에 표시하기
gmap <- ggmap(map)
gmap + geom_text(data=df, 
                 aes(x=lon, y=lat),
                 size=5,
                 label=df$name)































