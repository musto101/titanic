# Find correlations between the variables
library(dplyr)
library(reshape2)
options(scipen = 10000)

d <- dat_reshaped %>% 
  select(-c(Name, Ticket, titles, PassengerId))

d_cor <- as.matrix(cor(d))
d_cor_melt <- arrange(melt(d_cor), -abs(value))
d_cor_melt

table(dat_reshaped$titles)
dat_reshaped$titles <- factor(dat_reshaped$titles)

# uncorrelated predictors - Pclass, Parch, SibSp, Age, Embarked

fit <- glm(data = dat_reshaped, formula = Survived ~ Pclass + Parch + SibSp +
     Age + Embarked + titles, family = 'binomial')

summary(fit)


## Chosen predictors Pclass, Parch, SibSp, Age, Embarked.

