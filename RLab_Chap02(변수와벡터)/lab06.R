#데이터 종류  |  데이터 구조 이름
#한가지       |  벡터(vector), 팩터(factor), 행렬(matrix), 배열(Array)
#여러 가지    |  리스트(list), 데이터 프레임 (data frame)

#리스트 : 숫자나 문자처럼 여러 종류의 자료형을 가질 수 있으며
#         벡터뿐만 아니라 행렬, 배열 등 데이터구조로 담을 수 있음.

x <- list(c(1:5), c(1:50))
x

# flower와 color라는 키로 리스트가 만들어짐.
x <- list(flower = "rose", color = c("red", "white"))
x

x[1]          # 인덱스 1을 선택
x[[1]]       # 인덱스 1의 데이터 값을 선택

x[1]       # 인덱스 1(=flower)을 선택
x[[1]]    # 인덱스 1(=flower)의 데이터 값을 선택
x$flower # x$key, x[[1]]와 같음.

ds <- c(10, 15, 70, 85)

myinfo <- list(name = "류현진", age = 35, status = TRUE, score = ds)
myinfo


# 리스트 요소를 접근이나 출력하는 방법
myinfo[[1]]
myinfo[3]

myinfo$name  # $이용하는 방법 권장.
myinfo$score

# unlist() : 리스틀 벡터로 변경시키는 함수
vmyinfo <- unlist(myinfo)
vmyinfo
# as.integer() : 다른 데이터형을 숫자형으로 바꿔주는 함수수
v1 <- as.integer(vmyinfo[2])
v1

# 팩터(factor) : 범주(레벨, 카테고리)형 데이터를 관리하는 데이터 구조. 산술계산 불가능
# 예) 남녀의 성별(M,F), 혈액형(A, B, AB, O)

x <- factor(c("M", "F", "F", "M"))  #팩터 구조의 데이터를 변수에 할당.
x
class(x)    # 팩터형으로 출력됨.
levels(x)   # 범주를 확인
levels(x) <-  c("A", "B")   # F,M을 A,B로 대체
x
x[1]
x[1:3]
x[2:3]


bt <- c("A", "B", "B", "O", "AB", "A")
bt
fbt <- factor(bt)
fbt

bt[5]
fbt[5]

levels(fbt)
as.integer(fbt)
length(fbt)

fbt[7] <- "B"
fbt
length(fbt)


# z라는 값은 fbt 팩터의 level에 그 값이 없음. => NA 생성함.
fbt[8] <- "z"
fbt


# 해결책 : level을 추가하려면 아래 처럼 함.
bt<- c("A", "B", "B", "O", "AB", "A", "z")
bt
fbt <- factor(bt)
fbt


fbt[8] <- "z"
fbt






