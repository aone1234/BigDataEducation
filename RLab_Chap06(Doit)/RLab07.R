library(ggplot2)
library(dplyr)
midwest
View(midwest)
str(midwest)


# 혼자 해 보기
# 1) 미성년 인구 : (변수추가), 전체인구 : poptotal, 성인인구(popadults)

# midwest 불러오기
midwest <- as.data.frame(ggplot2::midwest)

# midwest에 백분율 추가
midwest <- midwest %>% 
  mutate(radio_child = (poptotal-popadults) / poptotal * 100)
head(midwest,10)

# 2)
midwest1 <- midwest %>% 
  arrange(desc(radio_child)) %>% select(county, radio_child) %>% 
  head(5)

# 3)
midwest <- midwest %>% 
  mutate(radio_childlevel = ifelse(radio_child >= 40, "large", 
                                   ifelse(radio_child >= 30, "middle", "small")))
# 미성년 비율 등급 빈도표
table(midwest$radio_childlevel)

# 4)
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% 
  mutate(radio_popasian = (popasian / poptotal) * 100) %>% 
  arrange(radio_popasian) %>% select(state, county, radio_popasian) %>% 
  head(10)


  




























