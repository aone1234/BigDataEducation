# 조건에 맞는 데이터만 추출하기
# dplyr 패키지 로드 & 데이터 준비
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

# %>% : 파이프 연산자(오퍼레이터) = 체인 오퍼레이터 (Ctrl + Shift + m)
# : 데이터 전달하기
# A를 전달(%>%) 받아서 B를 처리 


# filter() 함수 : 조건으로 행 선택하기
exam %>% filter(class == 1)

# 2반인 경우만 추출
exam %>% filter(class == 2)

# 1반이 아닌 경우만 추출
exam %>% filter(class !=1)

# 3반이 아닌 경우
exam %>% filter(class !=3)
