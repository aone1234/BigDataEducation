# ggplot2 로드
library(ggplot2)

# 1) 배경 설정하기
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))


# 2) 그래프 추가하기
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 3) x축 범위를 조정하는 설정 추가하기
# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)


# y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6) +
  ylim(10,30)

# R에서 데이터를 시각화 하는 기본함수 => plot()
?plot()
plot(1:10)

x <- rnorm(100)
y <-2 * x + rnorm(100)
plot(x, y)
plot(x, y, main = "선형적 상관 관계를 갖는 난수", xlab = "x", ylab = "2x", 
     xlim = c(-4,4), ylim = c(-4,4))

# 혼자서 해 보기

# 1)
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

# 2)
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + 
  xlim(0, 500000) + ylim(0, 10000)







