hf <- read.table ("https://www.randomservices.org/random/data/Galton.txt", header = T, stringsAsFactors = F)
str(hf$Gender)
hf$Gender <- factor(hf$Gender, levels = c("M","F"))
str(hf$Gender)
hf.son <- subset(hf, Gender =="M")
str(hf.son)

par(mar = c(4,4,1,1))
plot(hf.son$Father, hf.son$Height,  xlab = "아버지의 키", ylab = "아들의 키",  main = "아버지와 아들의 키", col = 3)
abline(y=mean(hf.son$father), col=2, lty=2)
abline(h=mean(hf.son$height), col=2, lty=2)
head(hf)

mean.x <- mean(hf.son$Father) # 아버지들의 키 평균
mean.y <- mean(hf.son$Height)  # 아들들의 키 평균
sxy <- sum((hf.son$Father - mean.x) *  (hf.son$Height - mean.y)) # 아버지의 키의 편차와 아들키의 편차들의 곱의 합
cov.xy <- sxy/(nrow(hf.son)-1)
cov(hf.son$Father, hf.son$Height)

(r.xy <- cov.xy/(sd(hf.son$Father)*sd(hf.son$Height)))
cor(hf.son$Father, hf.son$Height)

par(mfrow=c(1,1), mar=c(4,4,1,1))
plot(Height~Father, col=3, pch=16, data=hf.son, xlab="아버지의 키", ylab='아들의 키')
abline(lm(Height~Father, data=hf.son), col="red", lwd=2)

mean.x <- mean(hf.son$Father) # 아버지들의 키 평균
mean.y <- mean(hf.son$Height)  # 아들들의 키 평균
sxy <- sum((hf.son$Father - mean.x) *  (hf.son$Height - mean.y)) # 아버지의 키의 편차와 아들키의 편차들의 곱의 합
sxx <- sum((hf.son$Father - mean.x)^2)  # 아버지의 키의 편차 제곱합
b1 <- sxy / sxx  # 회귀계수 추정치(기울기)
b0 <- mean.y - b1 * mean.x  # 회귀 계수 추정치(절편)
print(paste('기울기:', b1, 'and', '절편:', b0, sep=""))

out <- lm(Height ~ Father, data = hf.son)
summary(out)

par(mar=c(2,2,2,1))
plot(Height~Father, data=hf.son, main="", xlab="아버지의 키", ylab="아들의 키", ylim=c(65,75))
abline(out,lwd=1.5)
