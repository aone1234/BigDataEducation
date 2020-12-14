# 다중변수 자료의 분석과 탐색
# 산점도 : 2개의 변수로 구성된 자료의 분포를 알아보는 그래프

mtcars
View(mtcars)
class(mtcars)
str(mtcars)
summary(mtcars)
head(mtcars)

wt <- mtcars$wt    # 중량자료 추출
mpg <- mtcars$mpg   # 연비 추출

# plot() : 2개의 변수를 가지고 산점도를 그림.
plot(x = wt, y = mpg, main = "중량-연비 그래프", xlab = "중량", 
     ylab = "연비", col = "red", pch = 19)

# 다중 변수들간의 산점도를 그릴때 사용 함수 : pairs()
vars <- c("mpg", "disp", "drat", "wt")
target <- mtcars[,vars]
class(target)
pairs(x = target, main = "다중 변수 산점도")



















