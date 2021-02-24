
library("exams")

# Para ver las preguntas en pdf
exams2pdf("usando_dataframe.Rmd")
exams2pdf("usando_knitr_para_tabla.Rmd")
exams2pdf("estimando_b0_lm.Rmd")
exams2pdf("estimando_b1_lm")

# Para ver las preguntas en html
exams2html("respuestas_como_matrices.Rmd", 
           dir=".", mathjax=TRUE)
