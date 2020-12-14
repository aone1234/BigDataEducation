# 막대 그래프 - 1. 평균 막대 그래프
# 각 집단의 평균값을 막대길이로 표현 그래프
# 1) 집단별 평균표 만들기
library(dplyr)
View(mpg)
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
  
# 2) 그래프 생성하기
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
       geom_col()

# 막대 그래프 - 2. 빈도 막대 그래프
# 값의 개수(빈도)로 막대의 길이를 표현한 그래프
# x축 범주 변수, y축 빈도
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# x축 연속 변수, y축 빈도
ggplot(data = mpg, aes(x = hwy)) + geom_bar()
