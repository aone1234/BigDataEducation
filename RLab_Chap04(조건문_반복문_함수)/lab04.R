# which함수 이해하기

# 학생들 성적을 벡터로 만듦.
score <- c(76,84,69,50,95,60,82,71,88,84)

# which 함수 사용 안하고 특정 데이터 찾기
length(score)


for (i in 1:length(score)) {
  print(score[i])
}

# 69점을 획득한 학생의 인덱스를 얻기 위해서 반복문 사용
for(i in 1:length(score)) {
  if(score[i] == 69) {
    idx <- i
    break;
  }
  print(score[i])
}

idx

# which() 함수는 조건에 맞는 인덱스를 리턴함.
idx <- which(score == 69)
idx

# which() 함수는 조건에 맞는 인덱스를 하나 혹은 여러개를 리턴함.
idx <- which(score>=85)
idx
class(idx)


# max()는 벡터의 데이터 중 최고값을 리턴
max(score)
# which.max(score)

min(score)
which.min(score)


idx <- which(score<=60)
idx
score[idx] <- 61   # 수정을 한꺼번에 함.
score


idx <- which(score>=80)
idx

# 80점 이상인 학생을 주출하여 또 다른 벡터를 만듦
highscore <- score[idx]
highscore


idx <- which(iris$Petal.Length>5.0)
idx
length(idx)


# 꽃잎의 길이가 50초과하는 데이터를 추출함.
irisbig <- iris[idx,]
irisbig


# 1~4열에서의 값들 중에서 5.0 초과된 값의 행과 열의 위치를 알고자 할때,
# 아래처럼 작성하면 됨.

idx <- which(iris[,1:4]>5.0, arr.ind = TRUE)
idx

idx <- which(iris[,1:4]>10.0, arr.ind = TRUE)
idx

idx <- which(iris[,1:4]>1.0, arr.ind = TRUE)
idx

dim(idx)







