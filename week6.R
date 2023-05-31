# reshape2 패키지 설치
install.packages("reshape2")
library(reshape2)

# 데이터 구조 확인
str(tips)
class(tips)

# 6개의 관측값 확인
head(tips)
tail(tips)

#요일별 팁을 받는 빈도 -> table()
table(tips$day)

#시간대에 따른 팁을 받는 빈도 -> subset()
dinner <- subset(tips, time=='Dinner')
lunch <- subset(tips, time=='Lunch')
table(dinner$day)
table(lunch$day)

#결제금액, 팁, 일행 수에 대한 평균
colMeans(dinner[c('total_bill','tip','size')])
colMeans(lunch[c('total_bill','tip','size')])

#손님별 팁의 비율
tip.rate <- tips$tip/tips$total_bill
tip.rate

#평균 팁의 비율
mean(tip.rate)

#성별별 팁을 주는 빈도
table(tips$sex)

#성별에 따른 팁을 받는 빈도
female <- subset(tips, sex=='Female')
male <- subset(tips, sex=='Male')
table(female$sex)
table(male$sex)

#결제금액, 팁, 일행수에 대한 평균
colMeans(female[c('total_bill', 'tip', 'size')])
colMeans(male[c('total_bill', 'tip', 'size')])

