#Question 1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

set.seed(125)
#head(segmentationOriginal)
inTrain <- createDataPartition(y = segmentationOriginal$Case, p = 0.7, list = FALSE)
training <- segmentationOriginal[inTrain,]
testing <- segmentationOriginal[-inTrain,]

modFit <- train(Case ~., data = training, method = "rpart")

inputData1 <- data.frame(TotalIntench2 = c(23000), FiberWidthCh1 = c(10), PerimStatusCh1 = c(2))

inputData2 <- data.frame(TotalIntench2 = c(50000, 57000), FiberWidthCh1 = c(10, 8), 
                        VarIntenCh4 = c(100, 100))

inputData3 <- data.frame(VarIntenCh4 = c(100), FiberWidthCh1 = c(8), PerimStatusCh1 = c(2))

predict(modFit, newdata = inputData3)