library(dplyr)
library(tidyverse)

#-------------------------------------------------------------------------------

#Read in data
rawData = read.csv('BlechnumMiniPam.csv')
rawData <- rawData %>%
  select(`Treatment`, `YII`)

ctrlData <- filter(rawData, Treatment == "Control")
treatmentData <- filter(rawData, Treatment == "Treatment")

#-------------------------------------------------------------------------------

#Check normality
hist(ctrlData$YII)
qqnorm(ctrlData$YII)
qqline(ctrlData$YII)

hist(treatmentData$YII)
qqnorm(treatmentData$YII)
qqline(treatmentData$YII)

#Check variance
var(ctrlData$YII)           #0.002908862
var(treatmentData$YII)      #0.02457873

#-------------------------------------------------------------------------------

#Two sample t-test
t.test(x = ctrlData$YII, y = treatmentData$YII, var.equal = T)

#Two Sample t-test

#data:  ctrlData$YII and treatmentData$YII
#  t = -9.7846, df = 74, p-value = 5.566e-15
#  alternative hypothesis: true difference in means is not equal to 0
#  95 percent confidence interval:
#  (-0.2823912 -0.1868374)

#sample estimates:
#  mean of x   mean of y 
#  0.2392857   0.4739000 

#-------------------------------------------------------------------------------

#Non-parametric t-test
wilcox.test(x = ctrlData$YII, y = treatmentData$YII, alternative = "two.sided")

#Wilcoxon rank sum test with continuity correction

#data:  ctrlData$YII and treatmentData$YII
#  W = 87, p-value = 2.492e-08
#  alternative hypothesis: true location shift is not equal to 0