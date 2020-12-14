

vc.1 <- c(95, 86, 47, 55, 68)
vc.1


vc.2 <- seq(100, 200, 2)
vc.2


vc.3 <- rep(TRUE, time=20)
vc.3

d <- c(100:200)

d

(d%%3)

(d%%3)==0

d[(d%%3)==0]

d[10]

tail(d, 10)

d[(d%%2) == 1 ]

d[seq(3, 100, 3)]

d.20 <- head(d, 20)
d.20

d.20[-5]
d.20[c(-5,-7,-9)]




absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)
names(absent) <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
absent  
absent["MAY"]
absent[c("JUL","SEP")]
sum(absent[c(1:6)])
mean(absent[c(7:12)])




