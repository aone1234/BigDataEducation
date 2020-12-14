
# 선그래프의 작성

library(ggplot2)

month <- c(1:12)
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)    # 지각생
length(late)
leagth(month)

# 선그래프는 시계열 자료의 내용을 파악하는 가장 기본적 방법
plot (
       x = month,
       y= late,
       type = "l",            # 그래프의 종류 선택(알피벳 : l,o,s)
       main = "지각생 통계",
       lty = 1,               # 선의 종류 (line type:1, 2..)
       lwd = 1,               # 선의 굵기 (1,2,3..)
       xlab = "달",
       ylab = "지각 건수",
       ylim = c(1, 15)       # y축 범위 지정
     
     )

month <- c(1:12)
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)  
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
length(late2)

plot (
      x = month,
      y= late,
      type = "o",             # 그래프의 종류 선택(알피벳 : l,o,s)
      main = "지각생 통계",
      lty = 1,               # 선의 종류 (line type:1, 2..)
      lwd = 2,               # 선의 굵기 (1,2,3..)
      col = "red",
      xlab = "달",
      ylab = "지각 건수",
      ylim = c(1, 15)       # y축 범위 지정
  
     )

# 기존 선그래프에 선그래프를 하나 더 추가하는 방법
lines (
        x = month,
        y = late2,
        type = "b",
        col = "blue"
      )


late3 <- c(1,2,3,4,5,1,10,15,2,4,2,2)
length(late3)
lines (
       x = month,
       y = late3,
       type = "b",
       col = "black"
      )

# 2015년 ~ 2026년까지 예상 인구수 추계자료
year <- c(2015:2026)
pop <- c(51014, 51245, 51446, 51635, 51811, 51973, 
         52123, 52261, 52888, 52504, 52777, 51771)
length(year)
length(pop)

plot (
  
       x = year,
       y = pop,
       main = "인구수 추계",
       type = "b",
       col = "red",
       xlab = "연도",
       ylab = "인구수"
       
     )

# 상자 그림 그리기
mpg <- as.data.frame(ggplot2::mpg)
df <- mpg %>%  
      filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data = df, aes(x = class, y = cty) + geom_boxplot())


























































































