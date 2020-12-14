# 단일변수의 연속형 자료에 대한 분석
# 1. 평균과 중앙값

weight <- c(60,62,64,65,68,69)
weightheavy <- c(weight,120)
weight
weightheavy


# 평균값 비교
# 평균값은 하나의 값이 특이값으로 들어오게 되면 평균이 확 올라가거나 내려간다.

mean(weight)
mean(weightheavy)


# 중앙값 비교
# 중앙값은 데이터를 일렬로 나열할때, 가운데 있는 값이기 때문에 영향을 덜 받는다.

median(weight)
median(weightheavy)

# 절사평균
# trim이라는 속성을 상하위 20%제외
# 나머지 값을 가지고 평균구함.
mean(weight, trim=0.2)
mean(weightheavy, trim=0.2)


# 사분위수에 대한 이해하기
data <- c(60,62,64,65,68,69,120)

# 사분위수를 구하는 함수
quantile(data)    # 25% 단위로 끊어서 출력을 한다.
quantile(x=data, probs = (0:10)/10)  # 10% 단위로 끊어서 출력함.

# summary() 함수를 이용해서 출력하면 6개의 값이 산출이 된다.
# 이게 바로 기초적인 분석이다.
# 최소값, 1사분위수, 중앙값(2사위분수), 평균, 3사분위수, 최대값이 출력이 된다.

summary(object = data)

mydata <- c(1:10)
mean(x=mydata)

# 표준편차가 작다. 작다는 것은 바로 평균에 가까이 모여있다.
# 표준편차가 크다. 크다는  것은 바로 평균과 멀리 떨어져 있다.
var(x=mydata)
sd(x=mydata)

mydata <- c(1,1,1,1,1)
mean(x=mydata)
var(x=mydata)
sd(x=mydata)

mydata2 <- c(60,100,64,101,150,115,120)
mean(x=mydata2)

# 값의 범위 알아내는 함수수
range(mydata2)

# diff() 통해서 값이 크면 클수록 평균과 많이 관측값들이 떨어져 있다라고 해석을 하면 됨.
diff(x=range(mydata2))

































