library(dplyr)
library(readr)

train <- read_csv("admissions-train.csv")
test <- read_csv("admissions-test.csv")

fitSimple <- lm(formula = Chance.of.Admit~GRE.Score+TOEFL.Score+CGPA.Score,
          data = train)

fitSquare <- lm(formula = Chance.of.Admit~GRE.Score^2+GRE.Score+TOEFL.Score^2+TOEFL.Score+CGPA.Score^2+CGPA.Score,
                data = train)

#predictionSimple <- predict(fitSimple, test)
#predictionSquare <- predict(fitSimple, test)

saveRDS(fitSimple, "modeloRegresionSimple.rds")
saveRDS(fitSquare, "modeloRegresionSquare.rds")