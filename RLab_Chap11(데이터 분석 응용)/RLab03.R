# 바람개비 돌리기

# 패키지 설치 (imager)

# 패키지 로딩
library(imager)

# 이미지 위치 경로
img_path <- "c://workspace2/data/pinwheel.png"

# 이미지 읽기
img <- load.image(img_path)

# 이미지 출력
plot(img)

# 이미지 크기 변환 (400X400 픽셀)
img <- resize(img, size_x = 400L, size_y = 400)

# 이미지 출려과 x,y축의 크기 설정
plot(img, xlim = c(0,400), ylim = c(0,400))

# 이미지 회전 초기 각도 설정
angle <- 0

while(TRUE) {               # 무한  번 반복('ESC'키 누르면 반복 종료)
  
  angle <- angle + 10       # 이미지 각도를 10도 더함.
  
  imrotate(img, angle, cx = 200, cy = 200) %>%    # cx,cy 위치에서 이미지 회전.
            plot(axes = FALSE)  # x,y 축은 나타나지 않음.
  
  Sys.sleep(0.2)                # 0.2초 동안 실행 대기.
  
  
  
}


# 1 ~ 100 사이의 3의 배수 합
# : 1부터 100까지 0.5초 간격으로 1씩 증가하는 동안,
# 3의 배수의 합을 화면에 출력 해 보자.

library(animation)

ani.options(interval = 0.5)
plot.new()

sum <- 0

for(i in 1:100) {

  if(i %% 3 == 0) {
  rect(0,0,1,1, col = "yellow")
  sum <- sum + i
  text(0.5, 0.5, sum, cex = 3, col = rgb(0,0,1,1))

  }
  
  ani.pause()
  
}


#-------------------------------------------------------------------------------
# 당구공 굴리기
# 당구공 굴러 가도록 해 보자.
# 먼저, 당구대와 당구공 이미지를 만들고,
# 각각 가로*세로 크기를 300*400, 40*40으로 변환한다.
# 단 초기위치는 (0,0)이며, 한번 이동은 x,y방향으로 10씩 움직인다.

library(magick)

# 당구공 이미지 읽기
ball <- image_read("c://workspace2/data/ball.png")

# 당구대 이미지 읽기
table <- image_read("c://workspace2/data/table.png")

# 당구공 이미지 가로X세로 변환
ball <- image_scale(ball, "40X40!")

# 당구대 이미지 가로X세로 변환
table <- image_scale(table, "300X400!")

# 당구공의 x, y 위치 초기화
x <- 0
y <- 0

while(TRUE) {
  # x, y의 위치
  Position <- paste("+", x, "+", y, sep = "")
  # table 이미지에 ball 이미지를 offset 위치로 겹침
  img <- image_composite(table, ball, offset = Position)
  # img 이미지 출력
  print(img)
  # 0.1초 대기
  Sys.sleep(0.1)
  
  # x, y의 위치 변환 시작
  if(x == 0)
    x_dir <- 1
  if(x == 260)
    x_dir <- -1
  if(y == 0)
    y_dir <- 1
  if(y == 360)
    y_dir <- -1
  
  x <- x + 10 * x_dir
  y <- y + 10 * y_dir
  # x, y의 위치 변환 : 끝
  
}











































