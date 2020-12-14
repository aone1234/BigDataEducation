install.packages("ggplots2")

# 기본적인 막대그래프
library("ggplot2")
month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month, rain)
df

ggplot(data=df, aes(x=month, y=rain)) + 
       geom_bar(stat = "identity", width = 0.7, fill = "red")  
                         # y축의 값을 최대치에 맞추겠다.

# 막대 그래프 꾸미기
ggplot(data = df, aes(x=month, y=rain)) + 
       geom_bar(stat = "identity", width = 0.7, fill = "blue") +
       ggtitle("월별 강수량") + 
       theme(plot.title = element_text(size = 25, face = "bold", colour = "blue"))
       

ggplot(data = df, aes(x=month, y=rain)) + 
       geom_bar(stat = "identity", width = 0.7, fill = "blue") +
       ggtitle("월별 강수량") + 
       theme(plot.title = element_text(size = 25, face = "bold", colour = "blue")) +
       labs(x = "월", y = "강수량") + 
       coord_flip()    # 가로로 표시

# 히스토그램
ggplot(iris, aes(x = Petal.Length)) +
       geom_histogram(binwidth = 0.5)

ggplot(iris, aes(x = Petal.Length, fill = Species, color = "Species")) +
       geom_histogram(binwidth = 0.5)    # 누적형 막대 그래프

ggplot(iris, aes(x = Petal.Length, fill = Species, color = "Species")) +
       geom_histogram(binwidth = 0.5, position = "dodge")   
       # 막대들이 겹치지 않고 위치를 잡도록 하는 옵션
       # 그룹별로 한세트씩 출력함.

ggplot(iris, aes(x = Petal.Length, fill = Species, color = "Species")) +
       geom_histogram(binwidth = 0.5, position = "dodge") +
       theme(legend.position = "top")

# 산점도
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) + 
       geom_point(size = 3) +
       ggtitle("꽃잎의 길이와 폭") +
       theme(plot.title = element_text(size = 25, face ="bold", colour = "blue")) +
       labs(x = "꽃잎의 길이", y = "꽃잎의 넓이") +
       theme(legend.position = "top")

# 박스플릿(상자그림) 그리기 : 사분위수를 나타내는데 사용됨.

ggplot(iris, aes(y = Petal.Length)) +
       geom_boxplot(fill = "yellow")

# 그룹별
ggplot(iris, aes(y = Petal.Length, fill = Species)) +
       geom_boxplot(width = 0.8, outlier.shape = 2, outlier.color = "red") 
       
ggplot(iris, aes(y = Petal.Length, fill = Species)) +
       geom_boxplot(width = 0.8, outlier.shape = NA) 

ggplot(iris, aes(x = Petal.Length, y = Petal.Width, fill = Species)) +
       geom_boxplot(width = 0.8, outlier.shape = 2, outlier.color = "red") +
       stat_summary(fun.y = "mean", geom = "point", shape = 22, size = 3, fill = "blue")

# 선그래프 그리기
View(airmiles)

year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
df

ggplot(df, aes(x=year, y=cnt)) +
       geom_line(col = "red", , linetype = 6, size = 1, arrow = arrow()) 





























  