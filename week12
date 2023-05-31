#작업 폴더 설정
getwd()
setwd("C:/Users/home/Desktop/세종사이버")

getwd()

# ggplot2 설치
install.packages("ggplot2")
library(ggplot2)

#diamonds의 구조 확인
str(diamonds)
class(diamonds)
head(diamonds)
tail(diamonds)

#커팅 품질이 Premium이고 2캐럿 이상인 다이아몬드 데이터를 추출
diamonds.new <- subset(diamonds, cut=="Premium" & carat>=2)
diamonds.new

# 추출한 데이터를 shiny_diamonds.csv로 저장
write.csv(diamonds.new,"shiny_diamonds1.csv")
write.csv(diamonds.new,"shiny_diamonds2.csv", row.names=F)

# csv 파일을 불러와서 diamonds.load에 저장
diamonds.load <- read.csv("shiny_diamonds2.csv",header=T)
diamonds.load

#color가 D인 데이터를 제와하여 diamonds.new에 저장
diamonds.new <- subset(diamonds.load, color !="D")
diamonds.new

#shiny_diamonds.csv로 저장
write.csv(diamonds.new,"shiny_diamonds.csv", row.names=F)
