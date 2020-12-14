version

install.packages("ggplots")
install.packages("ggplot2")
install.packages("ggmap")
install.packages("devtools")
install.packages("dplyr")
install_github("dkahle/ggmap", force = TRUE)


library('devtools')
library("ggplot2")
library("ggmap")
library("dplyr")

# 구글키 등록
# register_google(key = "AIzaSyBQA8DO_BO2iMGki6apX5zY917Q-bhbAnQ")
register_google(key = "AIzaSyBwjleoQo7y0yQzf2CskzvCllvdQtqQvNM")

# 지점의 경도 위도
gc <- geocode(enc2utf8("종로구"))
gc           

# 경도, 위도를 숫자로 
cen <- as.numeric(gc)
cen

# 자동 생성
map <- get_googlemap(center = cen, zoom = 18, maptype = "hybrid")

# 지도 화면에 보이기
ggmap(map)
