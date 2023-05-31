#reshape2 패키지 로드
library(reshape2)

#str확인
str(tips)

#디렉토리 확인과 설정
getwd()

#myfunc1.R을 로드
source('myfunc1.R')

#성별로 tip의 평균
meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size')
meanbycol.tip('day')

#myfunc2.R을 로드
source('myfunc2.R')

#categorize.tip 함수를 실행하고 결과를 tips.new에 저장
tips.new <- categorize.tip(tips)

#상위 데이터 확인
head(tips.new)
tail(tips.new)
