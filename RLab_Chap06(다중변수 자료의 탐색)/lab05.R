library(ggplot2)
library(dplyr)

# 1.
midwest <- as.data.frame(ggplot2::midwest)

# 2.
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
midwest

# 3.
midwest$percentage <- midwest$asian / midwest$total * 100
midwest$percentage
hist(midwest$percentage)

# 4.
midwest$mean <- mean(midwest$percentage)
midwest$test <- ifelse(midwest$percasian >= midwest$mean, "large", "small")
head(midwest)

# 5.
table(midwest$test)
qplot(midwest$test)
