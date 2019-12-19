library(dplyr)
library(rpart)
library(plumber)


fitRegresion <- readRDS("modeloRegresionSimple.rds")
fitClass <- readRDS("modeloClassSVM.rds")
#* @apiTitle Machine Learning as a service.
#* @apiDescription Proyecto final del curso Product Development, maestria en ciencia de datos.

#Modelo de regresion:

#' @param GRE.Score Valor entero
#' @param TOEFL.Score Valor entero
#' @param CGPA.Score Valor real entre cero y diez

#' @post /titanic

function(GRE.Score, TOEFL.Score, CGPA.Score){
  
  features <- data_frame(GRE.Score=as.integer(GRE.Score),
                         TOEFL.Score=as.integer(TOEFL.Score),
                         CGPA.Score=as.numeric(CGPA.Score))
  out<-predict(fitRegresion, features)
  as.character(out)
}


#Modelo de clasificacion

#' @param Sepal.Length Valor entero
#' @param Sepal.Width Valor entero
#' @param Petal.Length Valor real entre cero y diez
#' @param Petal.Width
#' @post /Ttitanic02.

function(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width){
  features <- data_frame(Sepal.Length=as.numeric(Sepal.Length),
                         Sepal.Width=as.numeric(Sepal.Width),
                         Petal.Length=as.numeric(Petal.Length),
                         Petal.Width=as.numeric(Petal.Width))
  out<-predict(fitClass, features)
  as.character(out)
}
