# 데이터 그리기
# 1. plot() : 산점도 그래프
# 2. pairs() : 행렬 산점도 그래프
# 3. hist() : 히스토그램 그래프
# 4. barplot() : 막대 그래프
# 5. pie() : 파이 그래프
# 6. boxplot() : 상자그림 그래프


# 데이터 그리기 주요 옵션
# main : 그래프 이름
# col : 색상
# xlab, ylab : x축과 y축 이름
# xlim, ylim : x축과 y축 범위
# pch : 점의 종류
# cex : 점 크기
# type : 그래프 유형, 점(p), 선(ㅣ), 점선모두(b)
# lty : 선유형 (dotted)

# plot() : 산점도 그리기(데이터를 x축, y축에 점으로 표시하는 그래프
plot(iris$Petal.Length)
plot(iris$Petal.Length, iris$Petal.Width, main = "iris data", 
     xlab = " 꽃잎길이", ylab = "꽃잎 넓이", col = iris$Species)
pairs(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
      data = iris, col = iris$Species)

# hist() : 히스토그램
# 값의 범위마다 빈도를 표현한 것
# 데이터가 모여 있는 정도(분포)를 확인하기에 좋음

hist(iris$Sepal.Width, freq = F)

# barplot() : 데이터 크기를 막대 길이로 표현한 것
# 집단 간 차이를 확인하고자 할때 유용함.


# 품종별 꽃잎 길이의 평균 구함.
x <- aggregate(Petal.Length ~ Species, iris, mean)
# 막대 그래프 이름으로 품종 지정
barplot(x$Petal.Length, names = x$Species)

# pie() : 데이터 비율을 표현하는데 유용함
# 품종별로 꽃잎 길이 합
x <- aggregate(Petal.Length ~ Species, iris, sum)

#품종 이름을
pie(x$Petal.Length, labels = x$Species)

# boxplot() : 상자그림 그리기
boxplot(iris$Sepal.Width)

                















