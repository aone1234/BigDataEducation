# 데이터 정제 : 결측값(Missing Value) 처리
# 결측값 : 데이터 중 고의 또는 실수로 누락된 값을 의미한다.
# 결측값을 그대로 놔둔채 데이터 가공 => 결과값에 오류, 잘못된 연산
# => 적절한 정제처리 필요함.

# 결측값 처리방법
# is.na 함수 이용 : NA인 데이터가 있으면 T, 없으면 F로 나타냄.
# na.omit 함수 이용 : NA인 데이터를 제거함. 즉 NA가 포함된 행을 지움.
# 함수의 속성이용 : na.rm = T로 하여 함수 수행시, NA를 제외함.

View(airquality)

# 데이터 구조를 살펴봄
str(airquality)

# airquality 데이터에서 NA인 것은 TRUE, 아니면 FALSE로 나타냄.
is.na(airquality)

# NA가 총 44개 있음.
table(is.na(airquality))

# Temp에는 NA가 없음.
table(is.na(airquality$Temp))

# ozone에는 NA가 37개 발견됨
table(is.na(airquality$Ozone))

# NA가 없는 Temp는 평균이 구해짐
mean(airquality$Temp)

# NA가 있는 ozone은 평균이 NA로 나옴.
mean(airquality$Ozone)

# ozone 속성에서 NA가 없는 값만 추출함.
air_narm <- airquality[!is.na(airquality$Ozone),]
air_narm

# 결측값이 제거된 데이터에서는 mean함수가 정상적으로 동작함.
mean(air_narm$Ozone)

# na.omit함수를 이용해 결측값 처리하기
air_narm1 <- na.omit(airquality)
mean(air_narm1$Ozone)

# 함수 속성인 na.rm을 이용해 결측값 처리하기
mean(airquality, na.rm = T)


# 결측치 만들기
# 결측치 표기 - 대문자 NA
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

# 결측치 확인하기
is.na(df)

# 결측치 빈도 출력
table(is.na(df))


# 변수별로 결측치 확인하기
# sex 결측치 빈도출력
table(is.na(df$sex))

# score 결측치 빈도 출력
table(is.na(df$score))


# 결측치 포함된 상태로 분석
# 평균산출
mean(df$score)

# 합계산출
sum(df$score)

# 결측치 제거하기
# 결측치 있는 행 제거 하기
library(dplyr)

# score가 NA인 데이터만 출력
df %>% filter(is.na(score))

# score 결측치 제거하고 데이터 출력
df %>% filter(!is.na(score))
df

# score 결측치 제거한 데이터를 새로운 변수에 assign함.

df_nomiss

# score 평균 산출
mean(df_nomiss$score)

# score 합계 산출출
sum(df_nomiss$score)

# 여러변수 동시에 결측치 없는 데이터 추출하기
# score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 모든 변수에 결측치 없는 데이터 추출
df_nomiss <- na.omit(df)
df_nomiss

# 함수의 결측치 제외기능 이용하기 - na.rm = T
# 결측치 제외하고 평균 산출

mean(df$score, na.rm = T)

# 결측치 제외하고 합계 산출
sum(df$score, na.rm = T)





















































