# dplyr은 데이터를 다루는 7가지 동작 함수
# 1) 열방향 : 선택 - select()
# 2) 열방향 : 계산 - mutate()
# 3) 행방향 : 조건 - filter()
# 4) 행방향 : 추가 - bind_rows()
# 5) 행방향 : 정렬 - arrange()
# 6) 그룹 계산 - group_by() + summarise()
# 7) 열결합 : left_join()


install.packages("nycflights13")
library(nycflights13)
library(dplyr)
View(flights)

# 1) 열방향 : 선택 - select()
# 데이터에서 컬럼을 선택해서 사용함.
# select()는 선언된 순서대로 컬럼을 정렬함
select(flights, year, month, day)


# 2) 열방향 : 계산 - mutate()
# 출력 편의를 일부 데이터만 사용
flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
flights_sml

# 각 컬럼간의 계산으로 새로운 열을 만들 수 있음.
flights_sml <- mutate(
                      flights_sml, gain = arr_delay - dep_delay,
                      speed = distance / air_time * 60
                      )

# 행방향 : 조건 - filter()
filter(flights, month == 1)

# 행방향 : 정렬 - arrange()
# 지정되는 컬럼 순으로 오름차순 정렬해주는 함수
arrange(flights, dep_delay)

# 그룹계산 - group_by() + summarise()
# summarise() : 여러 데이터를 요약하여 특성을 파악하는 방식으로 
#               동작하는 함수들을 적용할때 사용.

summarise(flights, mean = mean(dep_delay, na.rm = T), n = n())

# na.rm = T : 결측값(NA)을 분석시 미포함.

# group_by() : 데이터에 지정한 컬럼별이라는 추가 
#              조건을 지정하는 기능을 수행.
flights_g <- group_by(flights, month)
flights_g
View(flights_g)

summarise(flights_g, mean = mean(dep_delay, na.rm = T), n = n())

# 열 결합 (join) - left_join()
flights2 <- select(flights, year:day, hour, origin, dest,tailnum, carrier)
flights2

# left_join() : 왼쪽 데이터를 기준으로 하고, by로 지정된 컬럼이 key로 
#               정하여 오른쪽 데이터를 왼쪽 데이터에 결합하는 함수.
airlines
flights_join <- left_join(flights, airlines, by = "carrier")
View(flights_join)

























