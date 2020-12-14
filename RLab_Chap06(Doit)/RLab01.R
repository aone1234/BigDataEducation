# 2019년 하반기 패밀리 레스토랑 온라인 예약 및 매출 데이터와 관련된 데이터.
# customer_r : 고객 정보 (183행, 데이터수)
# item_r : 매뉴 상품 정보 (10)
# order_info_r : 주문 상세 정보 (391)
# reservation_r : 주문 예약, 취소 정보 (396)


# dplyr 패키지
# : 데이터 조작과 처리에 특화된 R 패키지임. (디플라이알)
# : 데이터 처리하는 주요 패키지 자리 잡음.

# 열이름을 소문자로 변환 (결과 출력 안함)
colnames(customer_r) <- tolower(colnames(customer_r))
colnames(reservation_r) <- tolower(colnames(reservation_r))
colnames(order_info_r) <- tolower(colnames(order_info_r))
colnames(item_r) <- tolower(colnames(item_r))
head(customer_r)
tail(item_r)

# dplyr 패키지 설치
install.packages("dplyr")

# 패키지 로딩
library(dplyr)

# 파이프 연산자 (%>%) : 데이터 전달하기  = 체인 연산자 (chain operator), 파이프


# 내용		       표현방법		
# F(x) 		     x %>% F
# G(F(x))		   x %>% F %>% G

# count()함수 : 데이터를 세는 함수
# customer_r 데이터 셋을 count() 함수로 전달함
customer_r %>% count()

exam <- read.csv("csv_exam.csv")

exam %>% filter(class == 1)


# filter() 함수 : 조건으로 행 선택하기
head(order_info_r)
# item_id 값이 M0001인 행만 선택 출력
order_info_r %>% filter(item_id == "M0001")
order_info_r %>% filter(item_id == "M0001" & sales >= 150000)


# 2반인 경우만 출력
head(exam)

exam %>% filter(class == 2)

# 1반이 아닌 경우만 출력
exam %>% filter(class != 1)

# 3반이 아닌 경우만 출력
exam %>% filter(class != 3)

# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)

# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)

# 영어 점수가 80점 이하인 경우
exam %>% filter(english <= 80)

# 1반이면서 수학점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)

# 2반이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)

# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math>=90 | english >= 90)

# 영어 점수가 90점 이만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90  | science < 50)

# 1, 3, 5반에 해당되면 추출
# %in% (매치 오퍼레이터)
exam %>% filter(class == 1 | class ==3 | class ==5)
exam %>% filter(class %in% c(1,3,5))

# 추출한 행으로 데이터 만들기
# class가 1인 행 추출, class1에 할당
class1 <- exam %>% filter(class == 1) 

# class가 2인 행 추출, class2에 할당
class2 <- exam %>% filter(class == 2) 

# 1반 수학점수 평균 구하기
mean(class1$math)

# 2반 수학점수 평균 구하기
mean(class2$math)

# 혼자 해보기
library(ggplot2)
mpg <- as.data.frame(ggplot2 :: mpg)
head(mpg)

# 1) 배기량이 4이하인 자동차의 고속도로 연비 평균이 더 높은것
displ1 <- mpg %>% filter(displ <= 4)
# 1) 배기량이 5이상인 자동차의 고속도로 연비 평균이 더 높은것
displ2 <- mpg %>% filter(displ >= 5)
head(displ1)
mean(displ1$hwy)
mean(displ2$hwy)


# Q2.
manufacturer1 <- mpg %>% filter(manufacturer == "audi")
manufacturer2 <- mpg %>% filter(manufacturer == "toyota")
head(manufacturer1)
head(manufacturer2)

mean(manufacturer1$cty)
mean(manufacturer2$cty)

# Q3.
che <- mpg %>% filter(manufacturer == "chevrolet")
ford <- mpg %>% filter(manufacturer == "ford")
honda <- mpg %>% filter(manufacturer == "honda")
head(ford)
head(che)
head(honda)


mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))

mean(mpg_new$hwy)

# select() 함수 : (테이블에서) 열 선택하기
head(order_info_r)

#order_info_r 테이블에서 reserv_no열과 sales열을 선택하라
order_info_r %>% select(reserv_no, sales)


# math 추출
exam %>% select(math)

# class, math, english 변수 추출
exam %>% select(class, math, english)

# math 제외하고 출력
exam %>% select(-math)

# math, english 제외하고 출력
exam %>% select(-math, - english)

# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class==1) %>% select(english)
exam %>% 
  filter(class==1) %>% 
  select(english)

# id, math 추출하고 앞부분이 6행까지 추출하라
exam %>% 
  select(id, math,) %>% 
  head

# id, math 추출하고 앞부분이 10행까지 추출하라
exam %>% 
  select(id, math) %>% 
  head(10)

# 혼자서 해보기
# Q1.
str(mpg)
df <- mpg %>% 
        select(class, cty)
head(df, 10)

# Q2.

library(dplyr)
df_suv <- df %>% filter(class == 'suv')





  


























