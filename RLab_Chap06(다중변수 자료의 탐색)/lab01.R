# XY 플롯팅(plotting)
# plot() 함수를 이용하여 만든다

data()
women

w <- women$weight
plot(w)

h <- women$height
plot(h)

# par() : 그래프의 모양을 다양하게 조절할 수 있는 
#         그래프의 인수들을 설정, 조회 하는 함수.


par(bg='yellow')
par(fg="red")
plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준")

plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준", type="1")

# 1 : 그래프 모양을 선으로 표시

plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준", type="p")

# type=b : 점과 선으로 표시한다.
plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준", type="b")

# type=h : 각 값을 수직선으로 표시함.
plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준", type="h")

# type=s : 계단식으로 표시함.
plot(h,w,xlab="키", ylab = "몸무게", main = "여성의 평균 키와 몸무게", 
     sub="미국의 70년대 기준", type="s")

?plot

# PCH(plotting character) 심벌
?pch

plot(0:10, 0:10, main="PLOT", sub = "TEST", xlab="x-Lable", ylab="Y-Label", type="n")

par(bg="transparent")

# points() 함수 : 점을 그리는 함수
p <- c(9,1)
points(p, pch=1, cex=2)
points(p, pch=2, cex=2)
points(p, pch=3, cex=2)
points(p, pch=23, cex=2)

weight <- women$weight
height <- women$height

plot(height, weight, xlab = "키", ylab = "몸무게", pch=20, cex=1.5, col="blue", bg="yellow")











