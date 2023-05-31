x <- c(1,2,3)
x

y <- c('a','b','c')
y

z <- c(TRUE,FALSE)
z

w <- c(1,2,3,'a')
w

even <- seq(2,100,2)
even
sum(even)
mean(even)

d <- 1:100
d
d <- c(1:100)
d
odd <- d[seq(1,100,2)]
odd
odd[-c(41:50)]
pick <- odd[c(3,7,32)]
pick
names(pick) <- c('3번', '7번','32번')
pick
pick[-2]
pick[c('3번','32번')]
pick[1] <- 3
pick
pick["3번"] <- 10
pick

rep(c(1,2),3)
