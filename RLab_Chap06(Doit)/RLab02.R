# arrange() 함수 : 행 정렬하기
# sales 값을 오름차순으로 정렬
order_info_r %>% arrange(sales)

# 내림차순으로 정렬 : desc 옵션추가함.
order_info_r %>% arrange(desc(sales))

# reserv_no 순서대로 오름차순 정렬 후 다시 item_id로 오름차순 정렬.
order_info_r %>% arrange(reserv_no, item_id)

# 오름차순의 정렬하기.
exam %>% arrange(math)
# 내림차순의 정렬하기.
exam %>% arrange(desc(math))

# class 및 math 오름차순 정렬하기
exam %% arrange(class, math)

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
library(ggplot2)
head(mpg)

mpg %>% filter(manufacturer == 'audi') %>% 
  arrange(desc(hwy)) 
head(audi, 5)

# mutate() 함수 : 열 조작해서 새로운 열 생성하기

# 종합 변수 추가
exam
exam %>% mutate(total = math + english + science) %>% head

# 종합 변수, 총평균 변수 추가
exam %>% mutate(total = math + english + science, 
                mean =(math + english + science) / 3) %>% head

# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "PASS", "FAIL")) %>% head






