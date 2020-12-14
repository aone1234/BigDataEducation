# 테이블 조작
# bind_cols() 함수 : 테이블 열 붙이기
# order_info_r과 똑같은 temp_order_info_r 테이블
# 만들어서 두 테이블을 붙여 보자
library(dplyr)


order_info_r
temp_order_info_r <- order_info_r
bind_order_info_r <- bind_cols(order_info_r, temp_order_info_r)

# bind_rows() : 테이블 행 붙이기
bind_rows(order_info_r, temp_order_info_r)

# inner_join(), left_join(), right_join(), full_join(), full_join()
# 조인 : 테이블의 데이터를 연결 매개체가 되는 키(key)로 서로 연결하는 기법
# 이너 조인 : 조인 조건이 정확히 일치하는 경우 결과 출력 (동등조인)
# inner_join() : 일치하는 데이터 연결하기
# reservation_r(예약정보) 테이블과 order_info_r(주문정보) 테이블 연결 해 보자. 
# 예약번호(reserv_no)열을 키로 연결해 보자.
# => reserv_no가 일치하는 행들만 출력된 것을 확인.

View(reservation_r)
View(order_info_r)

data_inner_join <- inner_join(reservation_r, order_info_r, by = "reserv_no") %>%  
  arrange(reserv_no, item_id) %>% select(reserv_no, customer_id, item_id, sales)

# left_join() : 왼쪽 기준 모든 데이터 연결하기

# right_join() 함수 : 오른쪽 기준 모든 데이터 연결하기, 원리는 left_join()과 같음.

# 연결하는 기준 테이블이 오른쪽(rignt)이라는 판단

reservation_new <- right_join(reservation_r, order_info_r, by = "reserv_no") %>% 
  arrange(reserv_no, item_id) %>% select(reserv_no, visitor_cnt, cance, order_no, item_id, sales)
View(reservation_new)

# full_join() 함수 : 양쪽 모든 데이터 연결하기
# add_row() 함수사용하여 order_info_r 테이블에 임의의 reserv_no 생성해서 풀조인.

# 새로운 행 생성
table_added_row <- order_info_r %>% add_row(order_no = "1", item_id = "1",
                                            reserv_no = "1", sales = "1")
data_full_join <- full_join(reservation_r, table_added_row, by = "reserv_no") %>% 
  arrange(reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales)

# intersect() 함수 : 데이터 교집합 구하기

# reservation_r의 reserv_no 추출
reservation_r_rsv_no <- select(reservation_r, reserv_no)

# order_info_r의 reserv_no 추출
order_info_r_rsv_no <- select(order_info_r, reserv_no)
# 양쪽 데이터셋에 존재하는 reserv_no
intersect(reservation_r_rsv_no, order_info_r_rsv_no)

# setdiff() 함수 : 데이터 빼기, 차집합
setdiff(reservation_r_rsv_no, order_info_r_rsv_no)

# reservation_r 테이블에서 평균 방문 고객 수 (visitor_cnt) 
# 세명 이상인 고객을 구하되, 평균 방문 고객 수가 높은 고객부터 출력하시오.


data_reservation_r <- reservation_r %>%   # 테이블 선택해서 데이터를 전달
  group_by(CUSTOMER_ID) %>%               # 고객번호로 그룹화
  summarise(avg = mean(VISITOR_CNT)) %>% 
  filter(avg >= 3) %>%                    # 요약된 값이 3이상인 행만 선택
  arrange(desc(avg))

View(data_reservation_r)


reservation_r %>%
  group_by(CUSTOMER_ID) %>% 
  mutate(avg = mean(VISITOR_CNT)) %>%   # 방문고객수의 평균을 avg라는 열로 생성
  select(CUSTOMER_ID, avg) %>%          # 고객번호와 평균열 선택
  filter(avg >= 3) %>% 
  distinct(CUSTOMER_ID, avg) %>%        # 고객번호와 평균열의 유일값만
  arrange(desc(avg))

# order_info_r 테이블의 메뉴(item_id)별, 월별 평균 매출을 계산한 후 메뉴별, 
# 월별로 오름차순 정렬해서 출력하시오.(메뉴 아이템별 월 평균 매출)


# subset() : 조건식으로 데이터를 추출
# subset(x, 조건식, 열)

# substr() : 데이터에서 일부 문자열을 선택해서 추출
# substr(데이터(열이름), 시작위치, 종료위치)

order_info_r %>% mutate(reserv_month = substr(RESERV_NO,1,6)) %>% 
  group_by(ITEM_ID, reserv_month) %>% 
  summarise(avg_sales = mean(SALES)) %>% 
  arrange(ITEM_ID, reserv_month)




%>% 
































































