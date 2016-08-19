library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

subTrain <- training[,grepl("^IL",names(training))]

#str(subTrain)

preProc <- preProcess(subTrain, method = "pca", thresh = 0.8)
preProc
# trainPC <- predict(preProc,subTrain)
# trainPC$

trainPC <- predict(preProc, training[,-1])
head(trainPC)
#modelFit <- train(training$diagnosis ~ ., method = "glm", data = trainPC)
# 
# testPC <- predict(preProc, testing[,-1])
# confusionMatrix(testing$diagnosis, predict(modelFit, testPC))