# 데이터 정제 : 이상값 처리
# 논리적 혹은 통계학적으로 이상한 데이터가 입력 되어 있을 수 있음.
# ==> 이러한 데이터를 이상값(outlier)이라고 함.
# 통계학에서 이상값이란 다른 관측값과 멀리 떨어진 관측값.
# 성별 : M,F만 존재, 혈액형 : A,B,O,AB로만 표현


# 이상값이 포함된 환자 데이터
patient <- data.frame(name = c("환자1","환자2","환자3","환자4","환자5"),
                      age = c(22, 20, 25, 30, 27), 
                      gender = factor(c("M", "F", "M", "K", "F")),
                      blood.type = factor(c("A","O","B","Ab","C")))
patient

# 성별에 K가 입력 되거나 혈액형에 C값이 입력된 것은 명백한 이상값이다.

# 성별에서 이상값 제거
patient_outrm <- patient[patient$gender == "M" | patient$gender == "F",]
patient_outrm

# 성별과 혈액형에서 이상값 제거
patient_outrm1 <- patient[(patient$gender == "M" | patient$gender == "F") & 
                          (patient$blood.type == "A" | patient$blood.type == "B" |
                           patient$blood.type == "O" | patient$blood.type == "AB"),]
patient_outrm1

# 이상값을 모두 NA로 표현 한다면 NA관련 함수들 사용할 수 있다.

# 성별은 남자는 1, 여자는 2로 표시, 혈액형은 A,B,O,AB형을 각각 1,2,3,4로 표현.
# 이상값이 포함된 환자 데이터
patient <- data.frame(name = c("환자1","환자2","환자3","환자4","환자5"),
                      age = c(22, 20, 25, 30, 27), 
                      gender = factor(c(1, 2, 1, 3, 2)),
                      blood.type = factor(c(1, 3, 2, 4, 5)))
patient

# 성별에 있는 이상값을 결측값으로 변경
patient$gender <- ifelse((patient$gender < 1 | patient$gender > 2),
                          NA, patient$gender)
patient

# 혈액형에 있는 이상값을 결측값으로 변경
patient$blood.type = ifelse((patient$blood.type < 1 | patient$blood.type > 4),
                              NA, patient$blood.type)
patient

# 결측값을 모두 제거
patient[!is.na(patient$gender) & !is.na(patient$blood.type),]

# 어떤 사람의 나이가 120살이라고 입력 => 이상값? 정상값? => 판단하기 어려움.
# 200살?

airquality

# 상자그림(boxplot)을 통해 찾아봄
# 정상 범위 밖에 동그라미 표시가 있으면 특이값(이상값)을 의미.

# airquality 데이터의 이상값 처리
# boxplot을 이용하여 이상값을 구분
boxplot(airquality[,c(1:4)])
boxplot(airquality[,1])$stats       # 통계값 계산

# 임시저장 변수에 airquality 데이터 복사
air <- airquality

# ozone의 현재 NA개수 확인
table(is.na(air$Ozone))

# 이상값을 NA로 변경
air$Ozone <- ifelse(air$Ozone < 1 | air$Ozone > 122, NA, air$Ozone)

# 이상값 처리 후 NA 개수 확인(2개 증가)
table(is.na(air$Ozone))

# NA 제거
air_narm = air[!is.na(air$Ozone),]

# 이상값 두개 제거로 is.na 함수를 이용한 결과 보다 값이 줄어듬.
mean(air_narm$Ozone)

# 상자그림으로 극단치 기준 정해서 제거하기
# 상자그림 생성
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)

# 상자그림 통계치 출력
boxplot(mpg$hwy)$stats

# 결측치 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

library(dplyr)
# 결측치 제외하고 분석하기
mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy, na.rm = T))

# 혼자 해 보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

View(mpg)

# 1)
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv, NA)
table(mpg$drv)

# 2)
table(mpg$cty)
boxplot(mpg$cty)

# 상자그림 경계 출력
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

# 3)
mpg %>% 
    filter(!is.na(drv) & !is.na(cty)) %>%   # 결측치 제외
    group_by(drv) %>%                       # drv별 분리
    summarise(mean_cty = mean(cty))         # cty 평균 구하기기










































