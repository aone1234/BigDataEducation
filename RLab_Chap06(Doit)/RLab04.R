# summarise() 함수 : 행요약하기
# 열전체를 입력 값으로 함수를 계산하여 요약값을 출력.

# 주문 테이블에서 매출(sales)의 평균값을 구하라.
summarise(order_info_r, avg = mean(sales))
summarise(order_info_r, min_value = min(sales), max_value = max(sales))


order_info_r %>% summarise(order_info_r, min_value = min(sales), max_value = max(sales))

exam <- read.csv("csv_exam.csv")
exam


# 집단별 요약하기
# math 평균 산출
exam %>% summarise(mean_math = mean(math))

# class별로 분리
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

# 여러 요약통계량 한번에 산출하기
exam %>% 
  group_by(class) %>%                        # class별로 분리
  summarise(mean_math = mean(math),          # math 평균 합계
            sum_math = sum(math),            # math 합계
            medain_math = median(math),      # math 중앙값
            n = n())                         # 학생수

# 각 집단별로 다시 집단 나누기  -- 회사별, 구동방식별 분리
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>%        # cty 평균산출
  head(10)


# 혼자서 해보기

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg

mgp %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(total_mean)) %>% 
  head(5)

# 1. 
# class 별 분리 
#cty 평균 구하기
mpg %>% group_by(class) %>% summarise((mean_cty = mean(cty)))
# 2.
# class 별 분리
# 내림차순 정렬
mpg %>% group_by(class) %>% summarise((mean_cty = mean(cty))) %>% 
 arrange(desc(mean_cty))
# 3.
# manufacturer별 분리
# hwy 평균 구하기
#내림차순 정렬
# 상위 3행 출력
mpg %>% group_by(manufacturer) %>% summarise((mean_hwy = mean(hwy))) %>% 
  arrange(desc(mean_hwy)) %>% head(3)

# 4.
  
mpg %>% group_by(manufacturer) %>% summarise((mean_hwy = mean(hwy))) %>% 
  arrange(desc(mean_hwy))  

mpg %>% filter(class == 'compact') %>% group_by(manufacturer) %>% 
  summarise(count = n()) %>% arrange(desc(count))
  
reservation_r
head(reservation_r)

# group by : 행 그룹화하기
# : summarise() 함수와 함께 사용.
# 예약 테이블에서 고객번호(customer_id)로 그룹화하여(group by) 평균값(mean)을 구하라.
reservation_r %>%  
  group_by(customer_id) %>% 
  summarise(avg = mean(visitor_cnt))
  
























