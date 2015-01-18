
library(randomForest)
setwd("~/Documents/Prema/Prema_Folder/Kaggle/Titanic")

#read train file - it has 181 rows
train = read.csv("train-2.csv", header=TRUE)

#get sample of indexes
subs = sample((1:181), 100)

#create a sample file using the sampled indexes
trainSub = train[subs,]

#stuff below doesn't work as expected
pairs(trainSub[c(3,5,6,10,12)], pch = 21, bg = c("yellow", "red")[unclass(trainSub$Survived)])

pairs(trainSub[5:6], pch = 21, bg = c("yellow", "red")[unclass(trainSub$Survived)])


###################################

#get a sense of data
summary(trainSub$Age)
summary(trainSub$Fare)
summary(trainSub$Embarked)

#remove missing values

is.na(trainSub$Age)
trainSub[is.na(trainSub$Age),]
#remove rows with missing age values
trainSubClean = trainSub[!is.na(trainSub$Age),]

#check if missing values have been removed
is.na(trainSubClean$Age)
#randomForest

set.seed(123)
#irisRf = randomForest(x=iris[,-5],y=iris[,5],
#                      keepForest=TRUE, proximity=TRUE)
trainRf = randomForest(x=trainSubClean[,c(3,5,6,10,12)], y=trainSubClean[,2],
                       keepForest=TRUE, proximity=TRUE)
MDSplot(irisRf,fac=iris$Species,k=2,palette=irisColor)