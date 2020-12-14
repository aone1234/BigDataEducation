# 벡터(vector)의 이해
# 데이터 종류 : 한가지
# 차원 : 1차원(한줄) --한 종류를 한 줄로 묶어서 보관
x <- c(1,2,3)   #숫자형 벡터
x
y <- c("a","b","c","가")  #문자형 벡터
y
z <- c(TRUE,T,F,F)  #논리형 벡터터
z


#벡터는 동일한 자료형값을 넣어줘야 원하는 결과를 얻을 수 있음.
w <- c(1,2,3,"a","가","나")
w


# 연속적인 값을 벡터로 만드는 방법
r1 <- c(1:100)
r1

r2 <- c(1,2,5,50:100)
r2


r3 <- seq(1,101,3)
r3


r4 <- seq(0.1,1.0,0.2)
r4

# 반복을 통해서 벡터를 생성
r5 <- rep(1, times=5)
r5

r6 <- rep(1:5, times=3)
r6


r7 <- rep(c(1,2,3), times=5)
r7


score <- c(100,80,75)
score
names(score)
names(score) <- c( "국어", "영어", "수학")
names(score)
score

 
names(score) <- c("국어", "영어") 
names(score)
score

#벡터의 요소 추출 (인덱스를 이용함)
d <- c(1,4,6,10)
d[1]
d[2]
d[3]
d[4]
d[5]

# 벡터의 값을 변겅
d[2] <- 100
d[2]
d


GDP <- c(5000, 3000, 10000)
GDP
names(GDP)
names(GDP) <- c("한국", "중국", "일본")
GDP
GDP[1]
GDP['한국']
GDP[c('한국', '중국')]

# 벡터의 연산
d <- c(1,10,5,3)
d


# 벡터의 산술연산

2*d  #각 요소에다가 2를 곱해라
d-2
3*c+4


# 벡터와 벡터간의 연산 --> 벡터의 원소의 갯수가 같아야 함.

x <- c(2,4,6)
y <- c(1,3,5)
x+y   #대응하는 요소끼리 더하여 출력력
x*y
x/y
x%%y
z <- x+y
z

# 벡터의 함수 이용
d <- c(1:10)
d

sum(d)
sum(3*d)


# 벡터요소의 길이(개수수)
length(d)


# 벡터요소의 평균
mean(d[1:5])
max(d)
min(d)


# 정렬 (기본적으로 오름차순 정렬
sort(d)
sort(x = d, decreasing = TRUE)
sort(d,T)


v1 <- median(d)
v1

