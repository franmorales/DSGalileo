library(shiny)
library(rpart)
library(plumber)
library(caret)

fitR.Simple <- readRDS("modeloRegresionSimple.rds")
fitR.Square <- readRDS("modeloRegresionSquare.rds")
fitC.SVM <- readRDS("modeloClassSVM.rds")
fitC.KNN <- readRDS("modeloClassKNN.rds")

testClass <- read_csv("iris_test.csv")
testRegr <- read_csv("iris_test.csv")


predictions.SVM <- predict(fitC.SVM, testClass)
predictions.KNN <- predict(fitC.KNN, testClass)





shinyServer(function(input, output) {

    output$output1 <- renderPrint({
        confusionMatrix(table(predictions.KNN, testClass$Species))
    })    
    
    output$output2 <- renderPrint({
        confusionMatrix(table(predictions.SVM, testClass$Species))
    })
    
    output$output3 <- renderPrint({
        summary(fitR.Simple)
    })    
    
    output$output4 <- renderPrint({
        summary(fitR.Square)
    })
    
    output$text1 <- renderPrint({
        infile <- input$GetFile
        if (is.null(infile))
            return(NULL)
        datafile <- read.csv(infile$datapath,header=TRUE,sep=',')
        head(datafile)
    })

})
