# 차원 축소
# 변수 4개인 4차원 데이터에 대한 산점도 그리는 것 =>
#   4차원을 2차원으로 축소 그림.

install.packages("Rtsne")
library(Rtsne)
library(ggplot2)

iris
ds <- iris[,-5]      # 품종 정보 제외

# 중복 데이터 제거 : 102, 143
dup <- which(duplicated(ds))
dup      # 143번째 행 중복

ds <- ds[-dup,]
ds.y <- iris$Species[-dup]     # 중복을 제외한 품종 정보

# tsne 실행
# perplexity : 샘플의 개수 지정(대상 데이터의 행수/3) 보다 작게 지정함.
tsne <- Rtsne(ds, dims = 2, perplexity = 10)

# 축소 결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) +
       geom_point(size = 2)

# ------------------------------------------------------------------------------
# 3차원 산점도 작성
install.packages("rgl")
install.packages("car")

library(car)
library(rgl)
library(mgcv)

tsne <- Rtsne(ds, dim=3, perplexicy=10)

# 축소결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

# 회귀면이 포함된 3차원 산점도
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 회귀면이 없는 3차원 산점도
points <- as.integer(ds.y)
color <- c('red','green','blue')
# 점의 색을 품종별로 다르게 설정
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3, point.col = color[points],
          surface = FALSE)   # 회귀면을 표시하지 않음.
























































