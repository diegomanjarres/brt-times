library(readr)
library(dplyr)
library(ggplot2)
datos <- read.csv("projects/brt-times/logs0312/trips_calle100_average.txt", stringsAsFactors = F)
matplot(datos[, 1], datos[,2], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")

ggplot(datos, aes(as.character(dep_time_group), time)) +
  geom_boxplot(aes(fill = "calle100"))

