# 트리맵

install.packages("treemap")

# treemap 패키지 불러오기
library(treemap)

data("GNI2014")
head(GNI2014)

dim(GNI2014)

treemap(
        GNI2014,
        index = c("continent", "iso3"), # 계층구조 설정 (대륙-국가)
        vSize = "population",           # 타일의 크기
        vColor = "GNI",                 # 타일의 컬러
        type = "value",                 # 타일의 컬러링(value, index, comp, dens)
        bg.labels = "yellow",
        title = "세계국가별 인구 소득"
        )

# 인구는 아시아가 제일 높다.
# 소득은 미국과 유럽이 많이 높다.

# state.x77 데이터셋으로 트리맵 작성

# 매트릭스를 데이터프레임으로 변환
st <- data.frame(state.x77)
head(st)

# 주이름 열로 추가 (stname)
st <- data.frame(st, stname = rownames(st))

treemap(st,
        index = c("stname"),        # 주이름
        vSize = "Area",             # 타일의 크기()
        vColor = "Income",          # 타일의 컬러
        type = "value",              # 타일 컬러링 방법
        title = "미국 주별 면적 및 소득"
        )

# 타일의 면적은 주의 면적
# 타일의 색은 주의 소득
# 알래스카가 면적도 크고 소득도 높다.

#-------------------------------------------------------------------------------
# 버블차트(bubble chart) : 산점도 위에 버블의 크기로 정보를 표시하는 시각화 방법
# 3개의 변수 정보를 하나의 그래프에 표시.

head(st)

st <- data.frame(state.x77)
symbols(st$Illiteracy, st$Murder,            # 원의 x,y 좌표의 열
        circles = st$Population,             # 원의 반지름의 열
        inches = 0.3,                        # 원의 크기
        fg = "white",                        # 원의 테두리 색상
        bg = "lightgray",                    # 원의 바탕색
        lwd = 1.5,                           # 원의 테두리 두께
        xlab = "문맹률",
        ylab = "범죄율",
        main = "문맹률에 따른 범죄율"
        )

text(st$Illiteracy, st$Murder,
     rownames(st),                           # 출력할 텍스트
     cex = 0.6,                              # 폰트 크기
     col = "brown"                           # 폰트 컬러
     )

# 전반적으로 문맹률이 높아질수록 범죄율이 증가하는 추세.
# 인구수가 많은 주가 대체로 범죄율도 높은 것을 확인.
# 범죄율이 가장 낮은 주는 North Dakota

#-------------------------------------------------------------------------------
# 모자이크 플롯 (mosic plot)
# : 다중변수 범주형 데이터에 대해 각 변수의 그룹별 비율을 
#   면적으로 표시하여 정보를 전달.

head(mtcars)
mosaicplot(~ gear + vs,          # 대상변수 지정함. ~ 다음 변수가 x축 방향 표시, 
                                 # + 다음변수가 y방향으로 표시됨.
           data = mtcars,                # 대상 데이터셋 지정함.
           color = c("green", "blue"),   # y축 변수의 그룹별 음영을 달리 표시
           main = "기어와 엔진"
           )

# 기어의 개수가 가장 많은 경우는 3개 이다.
# 기어의 개수가 5개는 드물다.
# 엔진의 형태는 0, 1정도가 반반정도 된다.
# 기어의 개수가 홀수인 경우는 0타입이 많고, 짝수인 경우는 1이 훨씬 많다.














































































