#url=https://www.kaggle.com/code/mahmoud2620/red-wine-quality-ml-with-multiple-regression-ii/notebook


library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(randomForest)
library(ggcorrplot)
library(corrplot)
library(ppcor)
library(splines)

require(devtools)
install_version("Hmisc", version = "4.8.0")
library(Hmisc)
install_version("rms", version = "4.5.0")
library(rms)
install_version("EFAtools", version = "0.3.0")
library(EFAtools)
## re-install rlang
install.packages("rlang")
##re-install ggplot2
install.packages("ggplot2")
library(rlang)
library(ggplot2)
devtools::install_version("gtable", version = "0.3.1", repos = "http://cran.us.r-project.org")


wine <- read.csv("C:/Users/prane/OneDrive/Desktop/personal/Projects/Red Wine Quality/winequality-red.csv", stringsAsFactors=TRUE)

str(wine)

summary(wine)

str(wine)

head(wine)

colSums(is.na(wine))

set.seed(113)
#use 80% of dataset as training set and 20% as test set
sample <- sample(c(TRUE, FALSE), nrow(wine), replace=TRUE, prob=c(0.8,0.2))
train.wine <- wine[sample, ]
test.wine <- wine[!sample, ]

ggplot(wine,aes(x=quality,fill=as.factor(quality)))+
  geom_bar(width = 0.7)+
  ggtitle("Distribution of wine quality")+
  theme(legend.position = "none")

ggplot(wine,aes(y=quality,x=fixed.acidity))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=volatile.acidity))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=citric.acid))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=residual.sugar))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=chlorides))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=free.sulfur.dioxide))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=total.sulfur.dioxide))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=density))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=pH))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=sulphates))+
  geom_smooth(method="loess")

ggplot(wine,aes(y=quality,x=alcohol))+
  geom_smooth(method="loess")

corrplot(cor(train.wine), method="number")

pcor(wine,method="pearson")


wine2<-dplyr::select(wine,-quality)
data_matrix<-cor(wine2)
KMO(data_matrix)


fit1<-lm(quality~.,train.wine)
summary(fit1)

fit.step<-step(fit1,direction="both")


summary(fit.step)


test.step<-predict(fit.step,test.wine)   ##apply the model to the test data
test.step<-round(test.step)              ##round the value to the nearest integer
table(test.step,test.wine$quality) 


fit.poly<-glm(quality~poly(fixed.acidity,3)+
                volatile.acidity+
                poly(citric.acid,3)+
                residual.sugar+
                chlorides+
                free.sulfur.dioxide+
                poly(pH,3)+
                poly(total.sulfur.dioxide,3)+
                poly(density,2)+
                poly(sulphates,3)+
                poly(alcohol,3),data = train.wine)

summary(fit.poly)


test.poly<-predict(fit.poly,test.wine)   ##apply the model to the test data
test.poly<-round(test.poly)              ##round the value to the nearest integer
table(test.poly,test.wine$quality)   


dt<-rpart(quality~.,data =train.wine)
print(dt)


rpart.plot(dt)

test.dt<-predict(dt,test.wine)   ##apply the model to the test data
test.dt<-round(test.dt)          ##round the value to the nearest integer
table(test.dt,test.wine$quality) 

rf<-randomForest(quality~.,ntree=500,data =train.wine)
plot(rf)

rf2<-randomForest(quality~.,ntree=1000,data =train.wine)
plot(rf2)

test.rf2<-predict(rf2,test.wine)   ##apply the model to the test data
test.rf2<-round(test.rf2)         ##round the value to the nearest integer
table(test.rf2,test.wine$quality)