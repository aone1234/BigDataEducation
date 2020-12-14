# 데이터 종류
# 1)숫자 (numeric)
# 2)문자 (character) : 큰따옴표, 작은 따옴표로 둘러싸인 문자형.
# 3)논리 (logical) : TRUE,T,FALSE,F

x <- c(1, 2, 3, 4, 5) #정수형 데이터, 변수에 할당
x
class(x) #데이터의 종류나 구조를 출력하는 함수, 숫자형으로 출력됨.


x <- c(0.1, 0.2, 0.3, 0.4, 0.5) #실수형 데이터, 변수에 할당.
x
class(x) #숫자형으로 출력됨


x <- c(1L, 2L, 3L, 4L, 5L) #정수형으로 출력하려고 끝에 명시적으로 L을 붙임.
x
class(x)  #정수형으로 출력됨.


x <- c("A", "B", "C", "가","나","다" )
x
class(x) #문자형으로 출력됨.

# 날짜형
x <- "2020-10-15"
x
class(x) #문자형으로 출력됨.

x <- as.Date("2020-10-15") #날짜형으로 변환
x
class(x)

y <- as.Date("2020-12-21")
y
class(y)

y-x

x <- TRUE      #논리형 데이터 값(참)
y <- FALSE    #논리형 데이터 값(거짓)
class(x)
class(x); class(y)

x & x   #TRUE 그리고 TRUE는 TRUE
x & y   #TRUE 그리고 FALSE는 FALSE
(1<2) & (3>4) #동시 만족 여부
(1<2) | (3>4) #선택 만족 여부
!(1<2) #TRUE의 부정은 FALSE

# 그외 데이터 표현
# NA (Not Available) : 측정되지 않은 값 => 사용할수 없음. 결측치
# NaN (Not a Number) : 연산 불가능, 부적절한 값
# Inf, -Inf : 무한값(값이 너무 크거나, 너무 작아서 연산이 어려움)
# NULL : 정의 되지 않은 값 (없음)



















