# 1. 막대차트 시각화
# (1) 세로막대차트

char_data <- c(305, 450, 320, 460, 339, 480, 380, 520)
char_data
names(char_data) <- c("2016 1분기","2017 1분기","2016 2분기","2017 2분기",
                      "2016 3분기","2017 3분기","2016 4분기","2017 4분기")

# 세로막대차트 : 기본속성
barplot(char_data, ylim = c(0,600), col = rainbow(8), main = "2016년 vs 2017년도 
        분기별 매출현황 비교")

# 가로막대차트 
barplot(char_data, xlim = c(0,600), horiz = TRUE, col = rainbow(8), 
        main = "2016년 vs 2017년도 분기별 매출현황 비교")


# red와 blue 색상 4회 반복
barplot(char_data, xlim = c(0,600), horiz = TRUE, xlab = "매출액(단위:만원)", 
                            ylab = "년도별 분기현황", space = 2, cex.names = 0.8,
                            col = rep(c(2,4), 4))


# 1:검정, 2:빨강, 3:초록, 4:파랑,
# 5:하늘색, 6:자주색, 7:노랑색

data()
VADeaths

par(mfrow=c(1,2))           # 1행 2열 그래프 보기
barplot(VADeaths, beside = T, col = rainbow(5), main = "미국 버지니아주 하위계층 사망비율율")
barplot(VADeaths, beside = F, col = rainbow(5), main = "미국 버지니아주 하위계층 사망비율율",
        font.main = 4)

# 2.점 차트 시각화
par(mfrow=c(1,1))           # 1행 1열 그래프 보기
help("dotchart")

dotchart(char_data, color = c("green", "red"), lcolor="black", pch = 1:2, labels = names(char_data), 
         xlab = "매출액", main = "분기별 판매현황 점차트 시각화")

# 3. 파이 차트 시각화 

pie(char_data, labels = names(char_data), border = 'blue', col = rainbow(8), cex=1.2, 
    title("2016~2017년도 분기별 매출 현황"))

















