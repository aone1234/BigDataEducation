# cat() 함수 : 숫자나 문자를 결합하여 출력하는데, 외부결과 출력용으로도 응용할 수 있음.

connect <- file("result.txt","w")     # 파일 설정
# ?file()

x <- iris$Sepal.Length
x
cat(summary(x), file = connect)     # summary 함수의 결과를 파일에 기록
close(connect)                      # 파일 종료


# 데이터셋 확인하기 주요 함수
# head() : 데이터셋 앞부분 출력
# tail() : 데이터셋 뒷부분 출력
# str() : 데이터셋 구조 출력
# summary() : 요약 통계량 출력
# View() : 소스 창으로 데이터와 구조 확인
# dim() : 열과 행, 차원의 개수를 셈
# ncol() : 열개수를 셈
# nrow() : 행개수를 셈
# length() : 벡터 길이를 반환, 리스트나 데이터 프레임에서도 사용가능
#ls() : 지정된 전체변수(객체)를 보여줌


view(iris)
summary(iris)

# iris 데이터셋 구조

# 열이름                   의 미                 클래스
# ------------------------------------------------------------
# Species                  품 종                팩터구조
# Sepal.width              꽃받침 넓이          숫자형(number)
# Sepal.Length             꽃받침 길이          숫자형(number)
# petal.width              꽃잎 넓이            숫자형(number)
# petal.Length             꽃잎 길이            숫자형(number)


head(iris)
head(iris, 10)

tail(iris)
summary(iris)

# 요약 통계량 의미

# 요약 통계량                의  미                      설  명
# ---------------------------------------------------------------------
# min                        최소값             데이터에서 가장 작은 값
# 1st Qu                   1사 분위수            하위  25%의 위치 값
# Median                     중앙값              50%  중앙의 위치 값
# Mean                      평  균             모든 값을 더해서 개수로 나눈 값
# 3rd Qu                  3사 분위수             하위 75%의 위치 값
# Max                       최대값              데이터에서 가장 큰 값

summary(iris$Sepal.Length)
str(iris)
dim(iris)     # R에서 기본 출력 기준은 행부터임.
nrow(iris)
ncol(iris)    # iris의 열의 길이 셈.
ls()


# 데이터 조작 주요 함수

# 함 수                         설  명                 
# -----------------------------------------------------------
# rbind()         데이터 값을 행으로 취급하여 합침
# cbind()         데이터 값을 열으로 취급하여 합침
# split()         분리할 열 팩터를 기준으로 분리
# subset()        조건식으로 데이터를 추출
# substr()        데어터에서 일부 문자열을 선택해서 추출
# merge()         데이터프레임을 행이름이나 열이름으로 합침
# sort()          데이터 값의 순서를 정렬, 기본은 오름차순.
# order()         데이터 값의 순서 인덱스를 반환, 기본은 오름차순.
# unique()        유일값을 반환.
# rm()            변수(객체)를 삭제

x <- c(1,2,3,4,5)
y <- c(6,7,8,9,10)
rbind(x,y)
cbind(x,y)
split(iris, iris$Species)
subset(iris, iris$Sepal.Length >=7)
substr(iris$Species, 1, 3)

plot(iris$Petal.Length)
pairs()
hist(iris$Sepal.Width)
boxplot(iris$Sepal.Width)

