library(readr)
library(dplyr)
library(ggplot2)
calle100 <- read.csv("projects/brt-times/logs0312/results/trips_calle100.csv", stringsAsFactors = F)
matplot(calle100[, 3], calle100[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde calle 100")
dev.copy(png,'./charts/calle100.png')
dev.off()
ggplot(calle100, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "calle100")) +
   labs(title="Tiempo de viaje desde calle 100", x = "tiempo de salida(s)", y = "tiempo de viaje(s)")
ggsave("./charts/calle100_box.png", width=16, height=9)

calle100g <- read.csv("projects/brt-times/logs0312/results/trips_calle100_grouped.csv", stringsAsFactors = F)
matplot(calle100g[, 5], calle100g[,4], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde calle 100 cada 10 min")
dev.copy(png,'./charts/calle100g.png')
dev.off()
ggplot(calle100g, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "calle100g")) +
   labs(title="Tiempo de viaje desde calle 100 cada 10 min", x = "tiempo de salida(min)", y = "tiempo de viaje(s)")
ggsave("./charts/calle100g_box.png", width=16, height=9)

calle100gc <- read.csv("projects/brt-times/logs0312/results/trips_calle100_grouped_clean.csv", stringsAsFactors = F)
matplot(calle100gc[, 5], calle100gc[,4], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde calle 100 cada 10 min")
dev.copy(png,'./charts/calle100gc.png')
dev.off()
ggplot(calle100gc, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "calle100gc")) +
   labs(title="Tiempo de viaje desde calle 100 cada 10 min", x = "tiempo de salida(min)", y = "tiempo de viaje(s)")
ggsave("./charts/calle100gc_box.png", width=16, height=9)

calle100a <- read.csv("projects/brt-times/logs0312/results/trips_calle100_average.csv", stringsAsFactors = F)
matplot(calle100a[, 1], calle100a[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", , main="Promedio de tiempos de viaje desde calle100 cada 10 min.")
dev.copy(png,'./charts/calle100a.png')
dev.off()

calle100ac <- read.csv("projects/brt-times/logs0312/results/trips_calle100_average_clean.csv", stringsAsFactors = F)
matplot(calle100ac[, 1], calle100ac[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Promedio de tiempos de viaje desde calle100 cada 10 min.")
dev.copy(png,'./charts/calle100ac.png')
dev.off()

calle100m <- read.csv("projects/brt-times/logs0312/results/trips_calle100_median.csv", stringsAsFactors = F)
matplot(calle100m[, 1], calle100m[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Mediana de tiempos de viaje desde calle100 cada 10 min.")
dev.copy(png,'./charts/calle100m.png')
dev.off()

calle100mc <- read.csv("projects/brt-times/logs0312/results/trips_calle100_median_clean.csv", stringsAsFactors = F)
matplot(calle100mc[, 1], calle100mc[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Mediana de tiempos de viaje desde calle100 cada 10 min.")
dev.copy(png,'./charts/calle100mc.png')
dev.off()

flowcalle100 <- read.csv("projects/brt-times/logs0312/results/flow_calle100_grouped.csv", stringsAsFactors = F)
matplot(flowcalle100[, 1], flowcalle100[,2], type="h", xlab="tiempo de salida(min)", ylab="observaciones", main="Flujo de pasajeros en calle100")
dev.copy(png,'./charts/flow_calle100.png')
dev.off()

tripsflowcalle100 <- read.csv("projects/brt-times/logs0312/results/trips_flow_calle100_grouped.csv", stringsAsFactors = F)
matplot(tripsflowcalle100[, 1], tripsflowcalle100[,2], type="h", xlab="tiempo de salida(min)", ylab="viajes", main="Viajes observados en calle100")
dev.copy(png,'./charts/trips_flow_calle100.png')
dev.off()



heroes <- read.csv("projects/brt-times/logs0312/results/trips_heroes.csv", stringsAsFactors = F)
matplot(heroes[, 3], heroes[,4], type="l", xlab="tiempo de salida(s)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde heroes")
dev.copy(png,'./charts/heroes.png')
dev.off()
ggplot(heroes, aes(factor(dep_time), time)) +
  geom_boxplot(aes(fill = "heroes")) +
   labs(title="Tiempo de viaje desde heroes", x = "tiempo de salida(s)", y = "tiempo de viaje(s)")
ggsave("./charts/heroes_box.png", width=16, height=9)

heroesg <- read.csv("projects/brt-times/logs0312/results/trips_heroes_grouped.csv", stringsAsFactors = F)
matplot(heroesg[, 5], heroesg[,4], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde heroes cada 10 min")
dev.copy(png,'./charts/heroesg.png')
dev.off()
ggplot(heroesg, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "heroesg")) +
   labs(title="Tiempo de viaje desde heroes cada 10 min", x = "tiempo de salida(min)", y = "tiempo de viaje(s)")
ggsave("./charts/heroesg_box.png", width=16, height=9)

heroesgc <- read.csv("projects/brt-times/logs0312/results/trips_heroes_grouped_clean.csv", stringsAsFactors = F)
matplot(heroesgc[, 5], heroesgc[,4], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main ="Tiempo de viaje desde heroes cada 10 min")
dev.copy(png,'./charts/heroesgc.png')
dev.off()
ggplot(heroesgc, aes(factor(dep_time_group), time)) +
  geom_boxplot(aes(fill = "heroesgc")) +
   labs(title="Tiempo de viaje desde heroes cada 10 min", x = "tiempo de salida(min)", y = "tiempo de viaje(s)")
ggsave("./charts/heroesgc_box.png", width=16, height=9)

heroesa <- read.csv("projects/brt-times/logs0312/results/trips_heroes_average.csv", stringsAsFactors = F)
matplot(heroesa[, 1], heroesa[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", , main="Promedio de tiempos de viaje desde heroes cada 10 min.")
dev.copy(png,'./charts/heroesa.png')
dev.off()

heroesac <- read.csv("projects/brt-times/logs0312/results/trips_heroes_average_clean.csv", stringsAsFactors = F)
matplot(heroesac[, 1], heroesac[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Promedio de tiempos de viaje desde heroes cada 10 min.")
dev.copy(png,'./charts/heroesac.png')
dev.off()

heroesm <- read.csv("projects/brt-times/logs0312/results/trips_heroes_median.csv", stringsAsFactors = F)
matplot(heroesm[, 1], heroesm[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Mediana de tiempos de viaje desde heroes cada 10 min.")
dev.copy(png,'./charts/heroesm.png')
dev.off()

heroesmc <- read.csv("projects/brt-times/logs0312/results/trips_heroes_median_clean.csv", stringsAsFactors = F)
matplot(heroesmc[, 1], heroesmc[,2], type="l", xlab="tiempo de salida(min)", ylab="tiempo de viaje(s)", main="Mediana de tiempos de viaje desde heroes cada 10 min.")
dev.copy(png,'./charts/heroesmc.png')
dev.off()

flowheroes <- read.csv("projects/brt-times/logs0312/results/flow_heroes_grouped.csv", stringsAsFactors = F)
matplot(flowheroes[, 1], flowheroes[,2], type="h", xlab="tiempo de salida(min)", ylab="observaciones", main="Flujo de pasajeros en heroes")
dev.copy(png,'./charts/flow_heroes.png')
dev.off()

tripsflowheroes <- read.csv("projects/brt-times/logs0312/results/trips_flow_heroes_grouped.csv", stringsAsFactors = F)
matplot(tripsflowheroes[, 1], tripsflowheroes[,2], type="h", xlab="tiempo de salida(min)", ylab="viajes", main="Viajes observados en heroes")
dev.copy(png,'./charts/trips_flow_heroes.png')
dev.off()
