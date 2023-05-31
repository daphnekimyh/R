#정규분포

options(digits=3)
mu <- 170
sigma <- 6
ll <- mu-3*sigma
ul <- mu+3*sigma
print(c(ll,ul))

x <- seq(ll,ul,by=0.01)
nd <- dnorm(x,mean=mu,sd=sigma)
plot(x,nd,type='l',xlab='x',ylab='P(X=x)',lwd=2,col='red')
sum(nd)

pnorm(mu, mean=mu,sd=sigma)
pnorm(ll, mean=mu,sd=sigma)
pnorm(ul, mean=mu,sd=sigma)
pnorm(180, mean=mu,sd=sigma)-pnorm(175, mean=mu,sd=sigma)

qnorm(0.25, mean=mu,sd=sigma)
qnorm(0.5, mean=mu,sd=sigma)
qnorm(0.75, mean=mu, sd=sigma)

options(digits=5)
set.seed(5)
smp <- rnorm(400, mean=mu,sd=sigma)
hist(smp, probability=T, main="N(170,6^2)으로부터 추출한 표본의 분포(n=400",xlab="",ylab="",col='white',border='black')
lines(x,nd,lty=2,col='red')

options(digit=4)
mu <- 0
sigma <- 1
ll <- mu-3*sigma
ul <- mu+3*sigma

x <- seq(ll,ul,by=0.01)
nd <- dnorm(x,mean=mu,sd=sigma)
plot(x,nd,type='l',xlab='x',ylab='P(X=x)',lwd=2,col='blue')

p0.05 <- qnorm(0.05,mean=mu,sd=sigma)
p0.025 <- qnorm(0.025,mean=mu,sd=sigma)

m10 <- rep(NA,1000)
m40 <- rep(NA,1000)

set.seed(9)

for(i in 1:1000){
  m10[i] <- mean(rnorm(10,mean=170,sd=6))
  m40[i] <- mean(rnorm(40,mean=170,sd=6))
}

options(digits=4)
c(mean(m10),sd(m10))
c(mean(m40),sd(m40))

hist(m10,xlim=c(160,180),main="",xlab='x',ylab='y',col='skyblue')
hist(m40,xlim=c(160,180),main="",xlab='x',ylab='y',col='skyblue')

#중심극한정리

set.seed(123)
n <- 1000

r.1.mean=rep(NA, n)
r.2.mean=rep(NA, n)

for(i in 1:n){
  r.1.mean[i]=mean(rnorm(4, mean = 3, sd=1))
  r.2.mean[i]=mean(rnorm(4, mean = 170, sd=6))
}

options(digits=4)
c(mean(r.1.mean), sd(r.1.mean))
c(mean(r.2.mean), sd(r.2.mean))

hist(r.1.mean, prob=T, xlab='표본평균', ylab='밀도', main="", col='orange', border='red')
x1 <- seq(min(r.1.mean), max(r.1.mean), length=1000)
y1 <- dnorm(x=x1, mean=3, sd=(1/sqrt(4)))
lines(x1, y1, lty=2, lwd=2, col="blue")

hist(r.2.mean, prob=T, xlab='표본평균', ylab='밀도', main='', col='orange', border='red')
x2 <- seq(min(r.2.mean), max(r.2.mean), length=1000)
y2 <- dnorm(x=x2, mean=170, sd=(6/sqrt(4)))
lines(x2,y2,lty=2, lwd=2, col='blue')

set.seed(12)
t <- 10
p <- 0.1
x <- 0:10
n <- 1000
b.2.mean <- rep(NA,n)
b.4.mean <- rep(NA,n)
b.32.mean <- rep(NA,n)

for(i in 1:n){
  b.2.mean[i] <- mean(rbinom(2, size=t, prob=p))
  b.4.mean[i] <- mean(rbinom(4, size=t, prob=p))
  b.32.mean[i] <- mean(rbinom(32, size=t, prob=p))
}

c(mean(b.2.mean), sd(b.2.mean))
c(mean(b.4.mean), sd(b.4.mean))
c(mean(b.32.mean), sd(b.32.mean))

hist(b.2.mean, probability = T, xlim=c(0,4), main='표본크기:2', col='orange', border='red')
x1 <- seq(min(b.2.mean), max(b.2.mean), length=1000)
y1 <- dnorm(x=x1, mean=1, sd=sqrt(0.9)/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(b.4.mean, probability= T, xlim=c(0,4), main='표본크기:4', col='orange', border='red')
x2 <- seq(min(b.4.mean), max(b.4.mean), length=1000)
y2 <- dnorm(x=x2, mean=1, sd=sqrt(0.9)/sqrt(4))
lines(x2,y2,lty=2,lwd=2,col='blue')

hist(b.32.mean, probability = T, xlim=c(0,4), main='표본크기:32', col='orange', border='red')
x3 <- seq(min(b.32.mean), max(b.32.mean), length=1000)
y3 <- dnorm(x=x3, mean=1, sd=sqrt(0.9)/sqrt(32))
lines(x3,y3, lty=2, lwd=2, col='blue')

#유효성

x <- seq(-3,3,by=0.01)
y <- dnorm(x)
y.1 <- dnorm(x,sd=sqrt(1/3))
y.2 <- dnorm(x,sd=sqrt(7/18))

pnorm(0.1,sd=sqrt(1/3)) - pnorm(-0.1,sd=sqrt(1/3))
pnorm(0.1,sd= sqrt(7/18)) - pnorm(-0.1, sd = sqrt(7/18))

plot(x, y, type = 'l', ylim= c(0, 0.8), axes = F, ylab="", lwd = 3, col='yellow')
lines(x, y.1, col="red", lwd=3)
lines(x, y.2, col='green', lty=2, lwd=3)

sete.seed(123)
n <- 10
x <- 1:100
y <- seq(-3, 3, by=0.01)

smps <- matrix(rnorm(n*length(x)), ncol=n)
xbar <- apply(smps, 1, mean)
se <- 1/sqrt(10)
alpha <- 0.05
z <- qnorm(1-alpha/2)
ll <- xbar-z*se
ul <- xbar+z*se

plot(y, type='n', xlab='trial', ylab='z', main='95% Confidence Interval for Population mean', xlim=c(1,100), ylim=c(-1.5, 1.5), cex.lab=1.8)

abline(h=0, col='red', lty=2)
l.c <- rep(NA, length(x))
l.c <- ifelse(ll*ul>0, "red", "black")

arrows(1:length(x), ll, 1:length(x), ul, code=3, angle=90, length=0.02, col=l.c, lwd=1.5)

ci.t <- function(x, alpha=0.05){
  n <- length(smp)
  m <- mean(x)
  s <- sd(x)
  t <- qt(1-(alpha/2), df=n-1)
  ll <- m-t*(s/sqrt(n))
  ul <- m+t*(s/sqrt(n))
  ci <- c(1-alpha, ll, m, ul)
  names(ci) <- c("confidence Level", 'Lower limit', 'Mean'))
  return(ci)
}

smp <- c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)
ci.t(smp)
ci.t(smp, 0.1)
