# 반복문에 대해 알아보자.
# for 문

# for(변수 in 범위)
for(i in 1:5){
  print('*')
}

for(i in 1: 10) {
  print(i)
}

# cat() : 문장을 만들어서 출력하고자 할때 사용하는 함수.
# \n은 개행하라(이스케이프 문자)

for (i in 1:9) {
  cat("2 *", i, "=", 2*i, "\n")
}

c <- 20
cat("c의 값은", c, "\n")


for(i in 1:20){
  # 짝수인지 확인
  if((i%%2) == 0){
    cat("1-20까지의 짝수 : ", i, "\n")
  }
}  

for(i in 1:20){
  # 홀수인지 확인
  if((i%%2) != 0){
    cat("1-20까지의 홀수 : ", i, "\n")
  }
}  

# 값을 누적하기

sum <- 0
for (i in 1:1000) {
  sum <- sum + i
}

cat("1-1000 누적 값 : ", sum)

iris
head(iris) 

# num은 150이 저장
num <- nrow(iris)  
mylabel <- c()



for (i in 1:num) {
  # 꽃잎의 길이에 따라 레이블 결정
  if(iris$Petal.Length[i] <= 1.6) {
    mylabel[i] <- 'L'
  }else if(iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  }else {
    mylabel[i] <- 'M'
  }
  
}

mylabel


# 새로운 데이터프레임을 만들자
df_new_iris <- data.frame(iris$Petal.Length, mylabel)
df_new_iris
class(df_new_iris)
head(df_new_iris)

# while 문 (통상 무한루프를 실행할때 많이 사용함)
sum <- 0
i <- 1
while(i<=100) {
  sum <- sum + i        # 값을 누적하기
  i <- i + 1            # 이 라인 주석처리 되면 무한루프 처리됨.
}
print(sum)

# next문은 자신의 뒷문장은 실행하지 않고 반복문의 블럭끝으로 바로 이동함.
sum <- 0
for(i in 1:10) {
  if(i%%2 == 0) {
    next
  }
  # 홀수만 더하는 형태
  sum <- sum + i
}
print(sum)


sum <- 0
for(i in 1:10) {
  if(i%%2 != 0) {
    next
  }
  # 짝수만 더하는 형태
  sum <- sum + i
}
print(sum)


