# 패키지
# animation : 애니메이션을 GIF, HTML 등과 같은 포맷으로 저장하는 기능 제공.

# 10부터 1까지 1초 간격으로 숫자가 감소하는 애니메이션 (카운트 다운)

# 애니메이션 패키지 설치 / 로딩
install.packages("animation")
library(animation)

# 함수 정의와 호출
# 삼각형 면적 구하는 함수
getTriangleArea <- function(w, h) {
    area <- w * h / 2
    return(area)
}

getTriangleArea(10, 5)

# ani.option() : 애니메이션 옵션 설정, 조회함
# 매개변수 - interval : 애니메이션 시간간격(초). 디폴트 1
# nmax : 최대 반복수

# 1초 간격의 애니메이션 시간 설정
ani.options(inverval = 1)

# 그래픽 프레임 생성
plot.new()

for(i in 10:0) {
  # 그래픽 프레임 영역 설정
  rect(0,0,1,1, col = "yellow")
  text_size <- 11 - i    # 숫자 크기 설정(i가 감소하면서 점점 커짐)
  text(0.5, 0.5, i, cex = text_size, col = rgb(0,0,1,1))
  # 애니메이션 설정 시간(1초)만큼 대기, 현재 화면을 지움.
  ani.pause()
}


# for(val in 벡터값) {
#   명령문
# }

#================================

sum <- 0
for(i in 1:10) {
  sum <- sum + i
}
print(sum)

#================================

for(i in 1:10) {
  if(i %% 2 == 0)
    next
  sum <- sum + i
}
print(sum)

#================================

sum <- 0
i <- 1
while (i <= 10) {
  sum <- sum + i
  i <- i + 1
  
}
print(sum)

#================================

sum <- 0
i <- 1
repeat {
  sum <- sum + i
  i <- i + 1
  if(i > 10)
    break
}
print(sum)

# 2) 랜덤 막대 그래프
# 1초 간격으로 0~1 사이의 5개 난수를 만들어서 막대 그래프 출력

# runif() : 균등분포에서 표본 추출기능
# 매개변수 (runif(n, min = 0, max = 1))
# n : 표본추출수, min : 분포의 하한선, max : 분포의 상항선

# 1초 간격의 애니메이션 시간 설정
ani.options(interval = 1)

# 무한반복 ('ESC' 키를 누르면 반복 종료)
while(TRUE) {
  # 0 ~ 1 사이의 5개 난수 추출
  y <- runif(5, 0, 1)
  # 바차트 출력, 5개 무지개색의 팔레트 이용
  barplot(y, ylim = c(0,1), col = rainbow(5))
  # 애니메이션 설정 시간(1초)만큼 대기.
  ani.pause()
  
}

# 3) 동전 던지기 확률의 변환 차트
# 동전을 2개 동시에 던질때, 앞면이 나올 확률

                # 동 전

# 확률 표본       동전1           동전2          앞면의 수         수학적 확률
# -----------------------------------------------------------------------------
#       1          앞              앞                2                 1/4
#       2          앞              뒤                1                 2/4
#       3          뒤              앞                1                 2/4
#       4          뒤              뒤                0                 1/4

# 애니메이션 시간을 0.2초로 설정,
# 500번 반복, 각각 2개의 동전을 동시에 던질 때 
# 앞면이 나온수 (0,1,2)의 빈도의 누적값을 확률로 변환 => 막대 그래프로 출력.


plot.new()      # 새 화면 출력


# sample(x, size, replace = FALSE) 
# 매개변수 X : 표본추출 대상이 되는 벡터
# 매개변수 size : 추출할 표본의 수
# replace : 복원 주출(TRUE), 비복원 추출(FALSE) - 디폴트

# 앞면 발생 수별로 빈도 초기화
# 1번째 위치 : 모두 0인 빈도
# 2번째 위치 : 하나가 1(합이 1)인 빈도
# 3번째 위치 : 모두 1인(합이 2)인 빈도

count <- c(0,0,0)
for(n in 1:500) {      # 500회 반복
   # 0(뒷면), 1(앞면) 동전을 2회 복원 추출로 던짐
   # (동전 2개를 동시에 던지는 효과)
   coin <- sample(c(0,1), 2, replace = T)
   
   # 앞면이 나올 수별로 빈도를 1증가
   # 두 동전의 합
   index <- sum(coin) + 1
   
   # 앞면이 나올 수별로 빈도를 1증가
   # count()
   count[index] <- count[index] + 1

   # 앞면이 나올 수별 확률
   probability <- count / n
   
   title <- paste("반복 수 : ", n, "/500")

   
   barplot(probability,                # 확률에 대한 바 차트트
           names.arg = c(0,1,2), 
           xlab = "앞면이 나올 횟수",
           ylab = "확률",
           col = rainbow(3),
           main = title
           )
   # 0.05초 실행 대기(애니메이션 효과)
   Sys.sleep(0.05)
   
}


      






























































