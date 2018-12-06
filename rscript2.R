library(readr)
library(dplyr)
library(ggplot2)
calle100 <- read.csv("projects/brt-times/logs0312/trips_calle100.txt", stringsAsFactors = F)
matplot(calle100[, 3], calle100[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'calle100.png')
ggplot(calle100, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "calle100"))
ggsave("calle100_box.png")

calle100g <- read.csv("projects/brt-times/logs0312/trips_calle100_grouped.txt", stringsAsFactors = F)
matplot(calle100g[, 5], calle100g[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'calle100g.png')
ggplot(calle100g, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "calle100g"))
ggsave("calle100g_box.png")

calle100gc <- read.csv("projects/brt-times/logs0312/trips_calle100_grouped_clean.txt", stringsAsFactors = F)
matplot(calle100gc[, 5], calle100gc[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'calle100gc.png')
ggplot(calle100gc, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "calle100gc"))
ggsave("calle100gc_box.png")

calle100a <- read.csv("projects/brt-times/logs0312/trips_calle100_average.txt", stringsAsFactors = F)
matplot(calle100a[, 1], calle100a[,2], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'calle100a.png')

calle100ac <- read.csv("projects/brt-times/logs0312/trips_calle100_average_clean.txt", stringsAsFactors = F)
matplot(calle100ac[, 1], calle100ac[,2], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'calle100ac.png')



heroes <- read.csv("projects/brt-times/logs0312/trips_heroes.txt", stringsAsFactors = F)
matplot(heroes[, 3], heroes[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'heroes.png')
ggplot(heroes, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "heroes"))
ggsave("heroes_box.png")

heroesg <- read.csv("projects/brt-times/logs0312/trips_heroes_grouped.txt", stringsAsFactors = F)
matplot(heroesg[, 5], heroesg[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'heroesg.png')
ggplot(heroesg, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "heroesg"))
ggsave("heroesg_box.png")

heroesgc <- read.csv("projects/brt-times/logs0312/trips_heroes_grouped_clean.txt", stringsAsFactors = F)
matplot(heroesgc[, 5], heroesgc[,4], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'heroesgc.png')
ggplot(heroesgc, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "heroesgc"))
ggsave("heroesgc_box.png")

heroesa <- read.csv("projects/brt-times/logs0312/trips_heroes_average.txt", stringsAsFactors = F)
matplot(heroesa[, 1], heroesa[,2], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'heroesa.png')

heroesac <- read.csv("projects/brt-times/logs0312/trips_heroes_average_clean.txt", stringsAsFactors = F)
matplot(heroesac[, 1], heroesac[,2], type="l", xlab="tiempo de salida", ylab="tiempo de viaje")
dev.copy(png,'heroesac.png')
