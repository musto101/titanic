library(readr)
library(dplyr)

dat <- read_csv(file = 'titanic/data/train.csv')
head(dat)
str(dat)
colnames(dat)[colSums(is.na(dat)) > 0]

sum(is.na(dat$Age))
sum(is.na(dat$Cabin))
sum(is.na(dat$Embarked))

table(dat$Cabin)
table(dat$Sex)
table(dat$Embarked)


