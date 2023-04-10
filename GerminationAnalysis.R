library(tidyverse)
library(dplyr)
library(ggplot2)
library(Rmisc)

#-------------------------------------------------------------------------------
#Read in data

germRawData = read.csv('FirstGerm.csv')

#-------------------------------------------------------------------------------
#Analyze first germination time

germCtrl <- filter(germRawData, Treatment == "Control")
germTrt <- filter(germRawData, Treatment == "Treatment")

wilcox.test(x = germCtrl$First_germ, y = germTrt$First_germ, alternative = "two.sided")

#Wilcoxon rank sum test with continuity correction

#data:  germCtrl$First_germ and germTrt$First_germ
#W = 1, p-value = 1.016e-05
#alternative hypothesis: true location shift is not equal to 0

sum1 <- summarySE(germRawData, measurevar="First_germ", groupvars="Treatment", na.rm=TRUE)

blechnumGermPlot <- ggplot() +
  geom_bar(data=germRawData, aes(x=Treatment, y=First_germ, fill=Treatment), stat="summary") +
  geom_errorbar(data=sum1, aes(ymin=First_germ-se, ymax=First_germ+se, x=Treatment, y=First_germ, width=0.3)) +
  ylab("Treatment") +
  xlab("Average number of days to germinate") +
  theme_classic() +
  theme(legend.position = "None") +
  scale_fill_manual(values=c(Control="blue3", Treatment="brown1"))
  
blechnumGermPlot