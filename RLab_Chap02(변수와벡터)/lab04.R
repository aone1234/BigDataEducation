#벡터 연산
d <- c(1,10,5,3)
d

#벡터의 산술연산
2*d
3*d+4

#벡터와 벡터간의 연산 -> 벡터간 원소의 갯수사 같아야함
x <- c(2,4,6)
y <- c(1,3,5)
x+y
x-y
x*y
x/y
x^y
x%%y
z <- x+y
z
test <- c(x,y)
test

#벡터의 함수 이용
d <- c(1:10)
d
sum(d)
sum(3*d)

# 벡터 요소의 길이(개수)
length(d)

# 벡터 요소의 평균
mean(d)
max(d)
min(d)

sort(d)
sort(d,T)

v1 <- median(d)
v1

