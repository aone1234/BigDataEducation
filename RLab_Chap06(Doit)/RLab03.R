order_info_r
# mutate() 함수를 사용해서 예약번호(reserv_no) 별로 평균 매출을 확인하기

order_info_r %>%
  group_by(reserv_no) %>%
  mutate(avg = mean(sales))

# transmute() 함수 : 원래 열 빼고 새로운 열 생성하기
# 기능은 mutate()함수와 동일, 기존 테이블의 열을 반환하지 않음
order_info_r %>%
  group_by(reserv_no) %>%
  transmute(avg = mean(sales))

# mutate_all() 함수 : 모든 열 조작해서 새로운 열 생성하기
# funs() : 사용할 함수를 지정 

# 각 열의 최대값을 찾아 출력
order_info_r %>%
  mutate_all(funs(max))

# mutate_if() 함수 : 특정 조건 열만 조작해서 새로운 열 생성하기
order_info_r

# 열이 숫자형일 경우 로그(log)로 바꾸어라.
order_info_r %>%
  mutate_if(is.numeric, funs(log(.)))

# mutate_at() 함수 : 특정 열만 조작해서 새로운 열 생성하기
# mutate_all() 함수는 모든 열에 대해 조작하는 함수,
# mutate_at()함수는 지정한 열만 조작함.
# vars() : select()와 유사한 함수. 열을 선택하는 함수.

# 지정할 열에 대해 최대값을 구하는 max 함수 적용하기
order_info_r %>%
  mutate_at(vars(sales), funs(max))

# 혼자 해 보기
mpg <- as.data.frame(ggplot2::mpg)

# 1)
mpg_new <- mpg
mpg_new <- mpg_new %>% mutate(total = cty + hwy)
mpg_new

# 2)
mpg_new <- mpg_new %>% mutate(mean = (cty + hwy)/2)

# 3)
mpg_new %>%
  arrange(desc(mean)) %>% head(3)

# 4)
mpg %>% 
  mutate(total = cty + hwy, mean = total / 2) %>% 
  arrange(desc(mean)) %>% head(3)





























