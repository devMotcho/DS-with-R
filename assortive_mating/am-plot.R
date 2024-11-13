# a36919 <- "Bernardo Mamede"
id <- "Bernardo Mamede"
am <- read.csv("./assortive_mating.csv", sep = ",")



am$self_male <- gsub("blue", "azul", am$self_male)
am$self_male <- gsub("green", "verde", am$self_male)
am$self_male <- gsub("brown", "castanho", am$self_male)

am$partner_female <- gsub("blue", "azul", am$partner_female)
am$partner_female <- gsub("green", "verde", am$partner_female)
am$partner_female <- gsub("brown", "castanho", am$partner_female)

tabela <- table(am$self_male, am$partner_female)

# cria pdf
pdf("grafico.pdf", width = 8.27, height = 5.83)
mosaicplot(tabela, 
           main = "Cor dos olhos em casais",
           xlab = "Homens",
           ylab = "Mulheres",
           color = "orange",
           border = "purple",
           las = 1)

mtext("Bernardo Mamede", side = 3)
dev.off()

# csV
write.csv(am, file = "olhos.csv", row.names = FALSE)
