# 데이터 시각화 하기
# 산점도 만들기
x <- rnorm(100)
y <- 2 * x + rnorm(100)
plot (x, y, pch = 16,
      main = "점 스타일을 적용한 산점도")

plot (x, y, pch = ifelse(x*y > 1, 16, 1),
      main = "조건별로 점 스타일을 적용한 산점도")

z <- sqrt(1+x^2) + rnorm(100)

plot (x, y, pch = 1, 
     xlim = range(x), ylim = range(y,z),
     xlab = "x", ylab = "value")

points(x, z, pch = 17)
title("두 데이터 시리즈의 산점도")

plot(x, y, pch = 16, 
     col =  ifelse(y >= mean(y), "pink", "green"),
     main = "파란색을 이용한 산점도")

# 선그래프 만들기
# 시계열 데이터는 선 그래프가 시간에 따른 추세와 
# 변동을 보여 주기에 유용함.

t <- 1:50
y <- 3 * sin(t * 60) + rnorm(t)

plot (t, y, type = "l", 
      main = "간단한 선 그래프")

install.packages("nycflights13")      
install.packages("babynames")

data("flights", package = "nycflights13")
carriers <- table(flights$carrier)
carriers
sorted_carriers <- sort(carriers, decreasing = T)
sorted_carriers
barplot ( 
          head(sorted_carriers, 8),
          ylim = c(0, max(sorted_carriers) * 1.1),
          xlab = "Carrier", ylab = "Flights",
          main = "가장 많은 항공 편수를 기록한 상위 8개 항공사"
        )

flight_speed <- flights$distance / flights$air_time
hist(flight_speed, main = "비행 속도의 히스토그램램")

























































