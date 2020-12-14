# 메트릭스 (matrix) : 동일한 데이터형을 가지는 2차원
데이터형태의 자료구조임.

z <- matrix(1:20, nrow = 4, ncol = 5)
z


# byrow 속성은 데이터의 저장순서를 결정 짓는다.
# 기본값은 컬럼기준으로 저장이 된다.
z2 <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z2

# 벡터를 만들어서 매트릭스 형태로 변환하는 것.
x <- c(1:4)
x
y <- c(5:8)
y
z <- matrix(1:20, nrow = 4, ncol = 5)
z


# 벡터 x와 벡터 y를 이용하여 cbind()를 통해서
# 열방향으로 결합하여 매트릭스를 생성함.
m1 <- cbind(x, y)
m1

# 벡터 x와 벡터 y를 이용하여 rbind()을 통해서
# 행방향으로 결합하여 매트릭스를 생성함.
m2 <- rbind(x, y)
m2


z
x

m3 <- rbind(m2, z) #에러남
m3 <- rbind(m2, x) 
m3

m4 <- rbind(z, x) #에러남
m4 <- cbind(z, x)
m4

# 매트릭스에 접근하는 방법
z <- matrix(1:20, nrow = 4, ncol = 5)
z

z[2,3]   # 2행 3열의 값 출력
z[2,3] <- 55
z


z[1,] # 1행만 다 출력
z[,1]

# 1행 중에서 1-3열까지의 값을 출력
z[1, 1:3]

# 1행 중에서 1,2,4 열값을 출력
z[1, c(1,2,4)]

# 매트릭스에 행이름, 열이름을 주는 방법
score <- matrix(c(90,85,96,88,55,77,87,99,100,47,55,33), nrow = 4, ncol = 3)
score

rownames(score) <- c("최지만","류현진","손흥민", "추신수")
score

colnames(score) <- c("국어","영어","수학")
score


score[1,1]
score["최지만", "국어"]
score["류현진",]

score
score["손흥민", "국어"] = 100
score


sum(score[,"국어"])
mean(score[,"국어"])
