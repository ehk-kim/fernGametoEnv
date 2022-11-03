library(tidyverse)

rawData <- read.csv('SphaeopterisMiniPam.csv')
rawData <- rawData %>%
  select(`Treatment`, `YII`)

mean(rawData$YII)     #0.372
median(rawData$YII)   #0.355
range(rawData$YII)    #0.162, 0.598
