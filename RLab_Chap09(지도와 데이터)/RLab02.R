# 2. 설악산 근방의 지도보기

gc <-  geocode(enc2utf8("설악산"))
gc

# 경도와 위도를 숫자로로
cen <- as.numeric(gc)
cen
map <- get_googlemap(center = cen,           # 중심점 좌표
                     zoom = 9,               # 지도 확대 정도
                     size = c(640,640),      # 지도크기
                     maptype = "roadmap"     # 지도 유형형
                     )
ggmap(map)


# 3. 경도와 위도 값을 입력하여 지도 보기

cen <- c(-118.2333248, 34.085015)
map <- get_googlemap(center = cen,
                     zoom = 13,
                     maptype = "hybrid")
ggmap(map)

# 36.1141266, 128.3481734
