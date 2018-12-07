library(readr)
library(dplyr)
library(ggplot2)
calle100 <- read.csv("projects/brt-times/logs0312/trips_calle100.txt", stringsAsFactors = F)
matplot(calle100[, 3], calle100[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'calle100.png')
dev.off()
ggplot(calle100, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "calle100"))
ggsave("calle100_box.png", width=16, height=9)

calle100g <- read.csv("projects/brt-times/logs0312/results/trips_calle100_grouped.txt", stringsAsFactors = F)
matplot(calle100g[, 5], calle100g[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'calle100g.png')
dev.off()
ggplot(calle100g, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "calle100g"))
ggsave("calle100g_box.png", width=16, height=9)

calle100gc <- read.csv("projects/brt-times/logs0312/results/trips_calle100_grouped_clean.txt", stringsAsFactors = F)
matplot(calle100gc[, 5], calle100gc[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'calle100gc.png')
dev.off()
ggplot(calle100gc, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "calle100gc"))
ggsave("calle100gc_box.png", width=16, height=9)

calle100a <- read.csv("projects/brt-times/logs0312/results/trips_calle100_average.txt", stringsAsFactors = F)
matplot(calle100a[, 1], calle100a[,2], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'calle100a.png')
dev.off()

calle100ac <- read.csv("projects/brt-times/logs0312/results/trips_calle100_average_clean.txt", stringsAsFactors = F)
matplot(calle100ac[, 1], calle100ac[,2], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'calle100ac.png')
dev.off()

flowcalle100 <- read.csv("projects/brt-times/logs0312/results/flow_calle100_grouped.txt", stringsAsFactors = F)
matplot(flowcalle100[, 1], flowcalle100[,2], type="h", xlab="tiempo de salida(s)", ylab="observaciones")
dev.copy(png,'flow_calle100.png')
dev.off()



heroes <- read.csv("projects/brt-times/logs0312/trips_heroes.txt", stringsAsFactors = F)
matplot(heroes[, 3], heroes[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'heroes.png')
dev.off()
ggplot(heroes, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "heroes"))
ggsave("heroes_box.png", width=16, height=9)

heroesg <- read.csv("projects/brt-times/logs0312/results/trips_heroes_grouped.txt", stringsAsFactors = F)
matplot(heroesg[, 5], heroesg[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'heroesg.png')
dev.off()
ggplot(heroesg, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "heroesg"))
ggsave("heroesg_box.png", width=16, height=9)

heroesgc <- read.csv("projects/brt-times/logs0312/results/trips_heroes_grouped_clean.txt", stringsAsFactors = F)
matplot(heroesgc[, 5], heroesgc[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'heroesgc.png')
dev.off()
ggplot(heroesgc, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "heroesgc"))
ggsave("heroesgc_box.png", width=16, height=9)

heroesa <- read.csv("projects/brt-times/logs0312/results/trips_heroes_average.txt", stringsAsFactors = F)
matplot(heroesa[, 1], heroesa[,2], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'heroesa.png')
dev.off()

heroesac <- read.csv("projects/brt-times/logs0312/results/trips_heroes_average_clean.txt", stringsAsFactors = F)
matplot(heroesac[, 1], heroesac[,2], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)")
dev.copy(png,'heroesac.png')
dev.off()


flowheroes <- read.csv("projects/brt-times/logs0312/results/flow_heroes_grouped.txt", stringsAsFactors = F)
matplot(flowheroes[, 1], flowheroes[,2], type="h", xlab="tiempo de salida(s)", ylab="observaciones")
dev.copy(png,'flow_heroes.png')
dev.off()
