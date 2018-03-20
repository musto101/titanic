library(readr)
library(dplyr)
library(e1071)
library(data.table)

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

# dealing with NAs in the age column
summary(dat$Age)
hist(dat$Age)
boxplot(dat$Age)
skewness(na.omit(dat$Age))
kurtosis(dat$Age)
dat$Age[is.na(dat$Age)] <- median(na.omit(dat$Age))

# dealing with NAs in embarked column 

table(dat$Embarked)
dat$Embarked <- as.numeric(as.factor(dat$Embarked))
cor(dat$Embarked, dat$Survived, use = 'complete.obs')
dat_reshaped <- dat %>% 
  filter(!is.na(Embarked))

# Dealing with NAs in Cabin column 
dat$Cabin <- as.numeric(as.factor(dat$Cabin))
cor(dat$Cabin, dat$Survived, use = 'complete.obs')
dat_reshaped <- dat_reshaped %>% 
  select(-Cabin)

#Extract titles 
dat_reshaped <- dat_reshaped %>% 
  mutate(titles = sub("(.*,)", replacement = "", x = sub("([^.1]+)$", "", Name)))

table(dat_reshaped$titles)

dat_reshaped[dat_reshaped$titles %like% "Martin", 'titles'] <- 'Mrs'


# Convert to dummy variables

table(dat_reshaped$Sex)

dat_reshaped$Sex <- as.numeric(as.factor(dat_reshaped$Sex))

table(dat_reshaped$Sex) # 1 is female!!



