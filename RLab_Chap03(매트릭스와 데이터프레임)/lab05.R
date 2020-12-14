# 데이터프레임 알아보기

city <- c("서울","워싱턴","북경")  #문자형 벡터
# class()라는 함수 : 매개변수로 들어간 변수에 담긴 
# 데이터의 자료 구조를 알려준다
class(city)  


a <- c(1:10)   # 정수형 벡터
class(a)


b <- seq(0.0,1.0,0.1) #실수형 벡터
b
class(b)


# str() : 데이터의 요약정보를 알려줌.
str(a)
str(b)
str(rank)


rank <- c(1:3)

# city라는 문자형 벡터와 rank라는 정수형 벡터가 합쳐서 
# 데이터프레임 형태가 됨.
cityInfo <- data.frame(city, rank)
cityInfo


# 데이터프레임도 2차원 데이터 타입이니 얼마든지
# 인덱스로 접근가능하고 수정도 가능함.
cityInfo[1,1]
class(cityInfo)

iris
View(iris)

# dim(): 행과 열의 개수를 표시하는 함수
dim(iris)

# nrow(): 행의 개수 출력
nrow(iris)

# ncol(): 열의 개수 출력
ncol(iris)

# colnames(): 열의 이름 출력
colnames(iris)


# rownames(): 행의 이름 출력
rownames(iris)


# 데이터 셋의 앞(뒷)부분 일부 출력
head(iris,10)
tail(iris,9)


# 데이터셋의 요약 정보를 출력
str(iris)

# 데이터셋의 자료구조 출력
class(iris)

iris[,5]

# 품종은 팩터이다.
class(iris[,5])
levels(iris[,5])

# 빈도수 확인
table(iris[,"species"])

setosa <- subset(x = iris, Species == "setosa")
setosa
class(setosa)


v1 <- subset(x = iris, (Sepal.Length > 5.0) & (Sepal.Width > 4.0))
v1
class(v1)












