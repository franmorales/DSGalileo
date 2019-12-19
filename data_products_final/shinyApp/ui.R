library(shiny)
library(rpart)
library(plumber)
library(caret)

fitR.Simple <- readRDS("modeloRegresionSimple.rds")
fitR.Square <- readRDS("modeloRegresionSquare.rds")
fitC.SVM <- readRDS("modeloClassSVM.rds")
fitC.KNN <- readRDS("modeloClassKNN.rds")

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Estadisticas/metricas"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        ##########################Sidebar panel##########################    
        sidebarPanel(
            checkboxGroupInput("chkgrp",label="Modelos de clasificacion: ",
                               choices = c('SVM','KNN'),
                               selected = c('SVM','KNN')),
            
            checkboxGroupInput("chkgrp02",label="Modelos de Regresion, metricas: ",
                               choices = c('Polinomial de grado 1','Polinomial de grado 2'),
                               selected = c('Polinomial de grado 1','Polinomial de grado 2')),
            fileInput('GetFile','Carga')
        ),
        ##########################Sidebar panel##########################    
        # Show a plot of the generated distribution
        mainPanel(
            verbatimTextOutput(outputId = "output1"),
            verbatimTextOutput(outputId = "output2"),
            verbatimTextOutput(outputId = "output3"),
            verbatimTextOutput(outputId = "output4"),
            verbatimTextOutput(outputId = "text1")
        )
    )
))
