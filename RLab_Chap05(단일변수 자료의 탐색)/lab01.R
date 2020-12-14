# 단일변수(범주형, 연속형)에 대한 분석을 해보고 
# 그래프로 데이터 시각화를 한번 해보자.

favorite <- c("WINTER", "SUMMER", "SPRING", 
              "SUMMER", "SUMMER", "SPRING", 
              "FALL", "FALL", "SUMMER", "FALL")
class(favorite)
favorite
length(favorite)

# 범주형 데이터에서 빈도수를 출력 할때 table() 사용함
table(favorite)

# 비율계산
table(favorite) / length(favorite)

ds <- table(favorite)
ds
class(ds)
str(ds)


# 막대 그래프 : 집단 간 차이를 확인하고자 할때 유용함.
barplot(ds, main = "선호하는 계절")

# 품종별 꽃잎 길이의 평균을 구함.
x <- aggregate(Petal.Length ~ Species, iris, mean)
barplot(x$Petal.Length, names = x$Species)

# 원그래프 : 데이터 비율 표현하는데 유용함
pie(ds, main = "선호하는 계절")

x <- aggregate(Petal.Length ~ Species, iris, sum)
pie(x$Petal.Length, labels = x$Species)

c <- c("green", "red", "yellow", "black")
barplot(ds, main = "선호하는 계절", col=c)
pie(ds, main = "선호하는 계절", col=c)


favoritecolor <- c(2,3,1,1,1,3,1,1,1,2,1)
length(favoritecolor)
table(favoritecolor)
ds <- table(favoritecolor)
class(ds)

barplot(ds, main = "선호하는 색상")
c <- c("green", "red", "blue")
barplot(ds, main = "선호하는 색상", col=c)

# names() 이용하여 자료값 1,2,3을 green, red, blue로 변경함.
names(ds) <- c
ds
barplot(ds, main = "선호하는 색상", col=c)
pie(ds, main = "선호하는 색상", col=c)


city <- c("서울", "부산", "대구", "인천",
          "광주", "대전", "구미")
pm25 <- c(18, 21, 21, 17, 8, 11, 10)
colors <- c("red", "orange", "yellow","green",
            "lightblue", "blue", "violet")
pie(pm25, labels = city, col = colors, 
    main = "지역별 초미세먼지 농도",init.angle=90, clockwise=T)

# 막대 그래프에 속성을 최대한 이용함
height <- c(9,15,20,6)
label <- c("영업1팀")
name <- c("영업1팀","영업2팀","영업3팀","영업4팀")
rm(label)
barplot(height, names.arg = name, main = "부서별 영업 실적")
barplot(height, names.arg = name, main = "부서별 영업 실적", col=c)
barplot(height, names.arg = name, main = "부서별 영업 실적", col=rainbow(length(height)))
barplot(height, names.arg = name, main = "부서별 영업 실적", col=rainbow(length(height)), 
        xlab = "부  서", ylab = "영업실적(억원")


# 원그래프에 속성을 최대한 이용해 보자
x <- c(9,15,20,6)
label <- c("영업1팀","영업2팀","영업3팀","영업4팀")
pie(x, main = "부서별 영업 실적")
pie(x, init.angle = 90, labels = label, main = "부서별 영업 실적")
pct <- x/sum(x)
pct <- round(x/sum(x)*100)   # 각 항목의 비율 구함
pct
pie(x, init.angle = 90, labels = label, main = "부서별 영업 실적", col=rainbow(length(x)))

label <- paste(label, pct)
label
label <- paste(label, '%')
label
pie(x, init.angle = 90, labels = label, main = "부서별 영업 실적", col=rainbow(length(x)))

























