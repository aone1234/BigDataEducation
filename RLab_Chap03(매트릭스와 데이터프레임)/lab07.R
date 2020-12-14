# 데이터 가져오기와 내보내기

# 주요함수
# read.csv() : csv형식의 데이터 파일을 데이터프레임으로 불러옴.
# write.csv() : 데이터 프레임을 csv 형식 파일로 내보냄.

# read_excel() : 엑셀형식의 데이터 파일을 데이터 프레임으로 불러옴.
# write_excel() : 데이터 프레임을 엑셀 형식 파일로 내보냄.

# sink() : 출력 결과를 계속 기록
# cat() : 분석 결과를 외부 파일로 내보냄.

# save() : 변수를 파일로 저장
# load() : 파일에서 저장된 변수를 불러옴.

# csv(Comma-Seperated Values)

install.packages("readxl")
library(readxl)

x <- read.csv("reservation_r_csv.csv")
head(x)

y <- read_excel("reservation_r_excel.xlsx")
head(y)


install.packages("writexl")
library(writexl)

write.csv(reservation_r_csv, "csv_output.csv")

write_xlsx(y, "excel_output.xlsx")

# a <- read_excel("aa.xlsx")

# sink() 함수 : 분석 결과값 저장하기
sink("output.txt")    # 출력을 output.txt에 기록시작
x <- 1
y <- 2
x
y
x + y
sink()       # 기록 마침침

# save() : 변수를 파일에 저장하는 함수(.Rdata)
# load() : 변수를 불러오는 함수

x <- c(1,2,3)
y <- c(4,5,6)
save(x, y, file = "save.Rdata")


rm(x)
rm(y)

rm(list = ls())   # 메모리의 변수들 모두 삭제제

load("C:/workspace2/RLab_Chap03(매트릭스와 데이터프레임)/save.Rdata")
load("save.Rdata")    # save.Rdata 내용을 불러옴.


x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)

save(list = ls(), file = "save2.Rdata")
rm(list = ls())
load("save2.Rdata")
