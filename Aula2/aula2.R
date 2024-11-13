# aula 13/nov
# variaveis categoricas

set.seed(2024113 + 1100)
x <- sample(LETTERS[1:4], 100, replace=TRUE)
x <- factor(x)

y <- sample(LETTERS[11:14], 100, replace=TRUE)
y <- factor(y)

plot(x) # nao recomendado

# tabla de contingência
tc1 <- table(x)

barplot(
  tp1,
  col = rainbow(4),
  horiz = TRUE,
  las = 1
)

# gráfico em percentagem
tp1 <- prop.table(tc1) # faz precentagens



# com duas variaveis
tc2 <- table(x, y)
tc3 <- t(tc2)
barplot(tc2, col=rainbow(4), legend.text=TRUE, beside=TRUE)


# calcular proporções
tp2 <- prop.table(tc2)
tp3 <- prop.table(tc2, margin=1)# aula 13/nov
# variaveis categoricas

set.seed(2024113 + 1100)
x <- sample(LETTERS[1:4], 100, replace=TRUE)
x <- factor(x)

y <- sample(LETTERS[11:14], 100, replace=TRUE)
y <- factor(y)

plot(x) # nao recomendado

# tabla de contingência
tc1 <- table(x)

barplot(
  tp1,
  col = rainbow(4),
  horiz = TRUE,
  las = 1
)

# gráfico em percentagem
tp1 <- prop.table(tc1) # faz precentagens



# com duas variaveis
tc2 <- table(x, y)
tc3 <- t(tc2)
barplot(tc2, col=rainbow(4), legend.text=TRUE, beside=TRUE)


# calcular proporções
tp2 <- prop.table(tc2)
tp3 <- prop.table(tc2, margin=1) # sobre as linhas
tp4 <- prop.table(tc2, margin=2) # sobre as colunas

barplot(tp4, col=rainbow(16), legend.text = TRUE)

mosaicplot(tp4, col= rainbow(14))

pie(tc1)
