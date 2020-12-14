# 보스톤하우징 데이터셋을 분석해 본다.

# 데이터 수집
# BostonHousing 데이터 셋을 활용하기 위해서 mlbench 패키지를 인스톨 한다.
install.packages("mlbench")
library(mlbench)
data("BostonHousing")

# 5개의 변수만 추출해서 따로 데이터셋을 만들다.
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]
head(myds)
dim(myds)

grp <- c()
# grp변수에다가 medv(주택가격) 상,중,하 분류한 내용을 저장.
# 506번 루핑 하면서 해당 값을 grp에 저장함.
for(i in 1:nrow(myds)) {
  
    if(myds$medv[i] >= 25.0) {
      grp[i] <- "H"
    }else if (myds$medv[i] < 25.0 && myds$medv[i] > 17.0) {
      grp[i] <- "M"
    }else {
      grp[i] <- "L"
    }
    
}

grp <- factor(grp)
grp
grp <- factor(grp, levels = c("H", "M", "L"))
grp


# 기존의 myds라는 데이터 프레임에 grp 팩터를 추가

myds <- data.frame(myds, grp)
View(myds)

str(myds)

# 그룹별 주택의 빈도수
table(myds$grp)

# 여기까지 데이터 수집이 끝남.

# 분석과정 시작
# 1. 히스토그램 차트 작성
par(mfrow = c(2,3))        # 2*3 가상화면 분할
for(i in 1:5) {
                hist(myds[,i], 
                main = colnames(myds)[i],
                col = "yellow")
              }

par(mfrow = c(1,1))     # 가상 화면 원복

# 2. 박스상자

par(mfrow = c(2,3))        # 2*3 가상화면 분할
for(i in 1:5) {
                boxplot(myds[,i], 
                main = colnames(myds)[i],
                col = "yellow")
              }

par(mfrow = c(1,1))     # 가상 화면 원복

# 3. 그룹별 관측값 분포표 (범위)
boxplot(myds$crim ~ myds$grp, main = "1인당 범죄율율")

boxplot(myds$rm ~ myds$grp, main = "방의 개수")

# 4. 다중 산점도를 통한 변수들간 상관관계
pairs(myds[,-6])    # grp열 제외하고 나타내라라


color <- c("red", "green", "blue")

# 점의 모양 지정
point <- as.integer(myds$grp)
pairs(myds[,-6], pch = point, col = color[point])

# 5. 변수간의 상관계수를 확인
cor(myds[,-6])












































