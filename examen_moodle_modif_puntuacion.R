# Paso 1
library("exams")

# Paso 2, definir working directory
setwd("G:/Mi unidad/14_ExamsR/01_preguntas_regresion")

# Paso 3, select the questions
preguntas <- c("pregunta1.Rmd", "pregunta2.Rmd", "pregunta3.Rmd")

# Paso 4, cambiar la puntuacion, 0 para incorrecta y 1 para correcta
# tomado de una respuesta de Achim Zeileis en
# https://stackoverflow.com/questions/61667023/changing-the-default-punctuation-of-the-questions-in-exams2moodle-function
ee <- exams_eval()
ee$pointvec <- function(correct) c(pos = 1, neg = 0)
ee$pointvec("1000")

# Paso 5, create the moodle exam
exams2moodle(file=preguntas, 
             n=5, 
             schoice = list(eval=ee),
             name="Examen_para_moodle")