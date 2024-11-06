data <- read.csv("avalia-2.csv", sep=",")

str(data)

head(data)

colnames(data)

colnames(data) <- c("num", "curso", "ntrab", "naulas", "media")


data$ntrab <- as.numeric(data$ntrab)

head(data$ntrab)

data$nTrabLabel <- factor(data$ntrab, levels = c(1, 2, 3, 4, 5), 
                          labels = c("três ou menos", "três ou menos", "três ou menos", "quatro", "cinco"))

head(data$nTrabLabel)

# calculo media 0 - 20
min_media <- min(data$media, na.rm = TRUE)
max_media <- max(data$media, na.rm = TRUE)
data$media2 <- (data$media - min_media) * 20 / (max_media - min_media)

# cria pdf
pdf("trabalho-aula/avalia-plot.pdf", width = 8.27, height = 5.83)

# gráfico
boxplot(media2 ~ nTrabLabel, data = data, 
        main = "Média de Trabalhos Submetidos", 
        xlab = "n. de Trabalhos", 
        ylab = "Média", 
        col = "lightblue", 
        border = "darkblue",
        ylim = c(0,20))

# mediana
abline(h = median(data$media2, na.rm = TRUE), col = "red", lty = 2)

# nome
text(3, 2, "Bernardo Mamede", col="black")
# guarda no pdf
dev.off() 

# csv
data2 <- data[, c("nTrabLabel", "media2")]
write.csv(data2, file = "trabalho-aula/avalia-plot.csv", row.names = FALSE)

