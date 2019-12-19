library(dplyr)
library(readr)
library(caret)
#Asegurarse de que se tiene instalada la dependencia e1071: install.packages('e1071', dependencies=TRUE)

trainSet <- read_csv("iris_test.csv")
testSet <- read_csv("iris_train.csv")


#Cross validation 
control<-trainControl(method = "cv", number = 6)

#Metricas
metric<-"Accuracy"

#Creacion de modelos Key Nearest Neighbors y Support Vector Machine:
set.seed(7)
fit.knn <- train(Species~., data=trainSet, method="lda", metric=metric, trControl=control)

set.seed(7)
fit.svm <- train(Species~., data=trainSet, method="svmRadial", metric=metric, trControl=control)

#Guardando modelos para la puesta en produccion:
saveRDS(fit.knn, "modeloClassKNN.rds")
saveRDS(fit.svm , "modeloClassSVM.rds")