id <- "a36919"

n_simulacoes <- 100

resultados <- data.frame(
  auth = rep("Bernardo", n_simulacoes),
  sim_num = 1:n_simulacoes,              
  pw = integer(n_simulacoes),            
  pm = integer(n_simulacoes)             
)

# Realizando as simulações
for (i in 1:n_simulacoes) {
  baralho <- c(rep("mulher", 24), rep("homem", 24))
  sorteio <- sample(baralho, 35)
  
  mulheres_promovidas <- sum(sorteio == "mulher")
  homens_promovidos <- sum(sorteio == "homem")
  
  resultados$pw[i] <- mulheres_promovidas
  resultados$pm[i] <- homens_promovidos

  if (mulheres_promovidas + homens_promovidos != 35)
  {
    print("ERROR")
  }    
}

write.csv(resultados, "results.csv", row.names = FALSE)
