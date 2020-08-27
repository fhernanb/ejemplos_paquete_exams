
# Paso 1 - para cargar el paquete -----------------------------------------
library("exams")

# Paso 2 - para definir el directorio de trabajo --------------------------
setwd("####################################") # coloque su direccion

# Paso 3 - para explorar las preguntas ------------------------------------

# en pdf
exams2pdf("valor_presente_valor_futuro.Rmd")
exams2pdf("derivada_exponencial_num.Rmd") 
exams2pdf("ciudades_costeras.Rmd") 

# en html
exams2html("valor_presente_valor_futuro.Rmd", dir=".", mathjax=TRUE)
exams2html("derivada_exponencial_num.Rmd", dir=".", mathjax=TRUE)
exams2html("ciudades_costeras.Rmd", dir=".", mathjax=TRUE)


# Para crear el examen impreso --------------------------------------------
preguntas <- c("valor_presente_valor_futuro.Rmd",
               "derivada_exponencial_num.Rmd",
               "ciudades_costeras.Rmd")

n <- 2 # numero de temas diferentes

set.seed(1974) # semilla para poder replicar en el futuro los temas

# Para crear los cuadernillos
exams2nops(file=preguntas, n=n, 
           language = "pt-PT",
           date = Sys.Date(),
           institution = "Universidad Nacional de Colombia", 
           title = "Examen de literatura",
           dir = "folder_con_la_evaluacion", 
           name = "tema")

# Para crear las soluciones
set.seed(1974)
exams2pdf(file=preguntas, n=n, 
          dir="folder_con_la_evaluacion", 
          name="solucion")

# Para crear el examen moodle ---------------------------------------------

preguntas <- c("valor_presente_valor_futuro.Rmd",
               "derivada_exponencial_num.Rmd",
               "ciudades_costeras.Rmd")

n <- 2 # numero veces que se repite una pregunta

# Para indicar que 
# por cada acierto se gana 1 punto
# por cada falla se gana 0 puntos
ee <- exams_eval()
ee$pointvec <- function(correct) c(pos = 1, neg = 0)
ee$pointvec("1000")

# Para crear el examen
set.seed(1974)
exams2moodle(file=preguntas, 
             n=n, 
             schoice = list(eval=ee),
             name="Examen_didactico_de_prueba")


