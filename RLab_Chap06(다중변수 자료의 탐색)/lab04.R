# 패키지 설치
install.packages("dplyr")
install.packages("ggplot2")

# 패키지 로드
library(dplyr)
library(ggplot2)

# 데이터 검토
head(mpg)
View(mpg)

# 데이터 분석
# 1. 회사별 평균 연비 높은 순 정렬
mpg %>% group_by(manufacturer) %>% 
        summarise(mean.hwy=mean(hwy)) %>% 
        arrange(desc(mean.hwy)) 

# 2. 포드 연비 높은 순 정렬
mpg %>% 
    filter(manufacturer == "ford") %>% 
    group_by(model) %>% 
    arrange(desc(hwy))

View (mpg %>% 
        filter(manufacturer == "ford") %>% 
        group_by(model) %>% 
        arrange(desc(hwy)))

# 3. 배기량과 연비 관계 그래프
qplot(data= mpg, x = displ, y = hwy)

mean(mpg$hwy)
max(mpg$hwy)
min(mpg$hwy)
hist(mpg$hwy)


e2 <- c("Hello", "World", "is", "good")

# 문자처리함수
paste(e2, collapse = " ")    # 빈칸 구분자로 문자 붙이기
paste(e2, collapse = ",")

# 함수 파라미터 지정하기
# 'x = ' :   x축
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)

# 'geom = '  : 그래프 형식
qplot(data = mpg, y = hwy, x = drv, geom = "point")
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot")

# 'colour = '  : 색깔구분
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot", colour = drv)

# 함수 사용법이 궁금할때 help
?qplot


# 엑셀 데이터 불러오기
# readx1 패키지 설치
install.packages("readxl")
library(readxl)

# 엑셀 파일 불러오기
df_finalexam <- read_excel("finalexam.xlsx", sheet = 1, col_names = T)
df_finalexam
View(df_finalexam)

mean(df_finalexam$math)
mean(df_finalexam$history)
mean(df_finalexam$english)

# 첫번째 행 변수명으로 로드 x
df_finalexam <- read_excel("finalexam.xlsx", sheet = 1, col_names = F)
df_finalexam

# csv (Comma Separated values) 파일 불러오기
# - 범용 데이터 형식
# - 값 사이를 쉼표(,)로 구분
# - 용량 작음, 다양한 소프트웨어에서 사용

read.csv("csv_exam.csv", header = T)

# CSV로 저장하기
write.csv(df_finalexam, file = "output_newdata.csv")

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


# 2. 데이터 수정하기
# dplyr 패키지 설치 & 로드
install.packages("dplyr")
library(dplyr)


# 데이터 프레임 생성
df_raw <- data.frame(var1 = c(1,2,3),
                     var2 = c(2,3,2))
df_raw


# 1) 데이터 프레임 복사본 만들기
df_new <- df_raw  # 복사본 생성
df_new


# 2) 변수명 바꾸기
# '새변수명 = 기존변수명' 순서로 입력함.
df_new <- rename(df_new, variable2 = var2)
df_new
df_raw

# Q1. 
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new

# Q2.
library(dplyr)
mpg_new <- rename(mpg_new, city = cty)
mpg_new <- rename(mpg_new, highway = hwy)

# Q3.
head(mpg_new)


# 변수 조합해 파생변수 만들기
# 데이터 프레임 생성
df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))    
df

# var_sum 파생변수 생성
df$var_sum <- df$var1 + df$var2
df

# var_mean 파생변수 생성(더해서 2로 나눔)
df$var_mean <- df$var_sum/2
df

# mpg 통합 연비 변수 만들기
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)

# 조건문을 활용해 파생변수 만들기
# 1. 기준값 정하기
summary(mpg$total)
hist(mpg$total)

# 2. 조건문으로 합격 판정 변수 만들기
mpg$test <- ifelse(mpg$total >= 20, "pass", "fall")
head(mpg,20)

# 3. 빈도표로 합격판정 자동차수 살펴보기
table(mpg$test)

# 4. 막대 그래프로 빈도 표시하기
library(ggplot2)
qplot(mpg$test)

# 5. total을 기준으로 A,B,C 등급부여
mpg$grade <- ifelse(mpg$total >= 30, "A",
                   ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 25, "B",
                           ifelse(mpg$total >= 20, "C", "D")))
tail(mpg, 10)

table(mpg$grade)
qplot(mpg$grade)



west <- as.data.frame(ggplot2::midwest)
head(west)
tail(west)
summary(west)

library(dplyr)
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

midwest$ratio <- midwest$asian/midwest$total*100










































