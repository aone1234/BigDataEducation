
install.packages("ggplot2")         #ggplot2 패키지 설치
library(ggplot2)                    #ggplot2 패키지 로드


x <- c("a","a","b","c")
x


# 빈도그래프 출력

qplot(x)

# ggplot2의 mpg 데이터로 그래프 만들기
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x= drv, y = hwy)
qplot(data = mpg, x= drv, y = hwy, geom = "line")
qplot(data = mpg, x= drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x= drv, y = hwy, geom = "boxplot", colour = drv)
?qplot

#시험 점수 변수 만들고 점수 출력
score <- c(80,60,70,50,90)
score

#전체 평균 구하기
mean(score)

# 전체 평균 변수 만들고 출력하기
mean_score <-  mean(score)
mean_score







