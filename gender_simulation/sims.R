# Bernardo Mamede a36919 4/12/24

id <- 36919

sims <- read.csv("gender_sims.csv", sep=",")

colnames(sims) <- c("auth", "sim_num", "pw", "pm")

sim.ok <- sims[
  sims$pw <= 24 & sims$pm <= 24 &
    (sims$pw + sims$pm) == 35 &
    !sims$auth %in% c(
      "Derick/Ricardo", "Elvis/Wesley",
      "Rodrigo Delgado a57748 e Roberto Bonfim a60630", "Viviane/Melany", "Agilton", 
      "Cinthya/Guilhermina", "Inês Pereira", "Marília", 
      " Waldik da Cruz, Danilson Fortes"
    ),
]

m14 <- sum(sim.ok$pw <= 14)
pm14 <- m14 / nrow(sim.ok)
p_hat <- pm14
n <- nrow(sim.ok)
z <- 1.96

erro_padrao <- sqrt((p_hat * (1- p_hat)) / n)

ic_inf <- p_hat - z * erro_padrao
ic_supp <- p_hat + z * erro_padrao

set.seed(id)
sims.alea <- sim.ok[sample(nrow(sim.ok), 100), ]

write.csv(sims.alea, "sims100.csv", row.names = FALSE)


# pdf("histograma_simulacoes.pdf", width = 8.3, height = 5.8)

probs <- dhyper(11:24, m = 24, n = 24, k = 35)

breaks <- function(x) (min(x) - 0.5):(max(x) + 0.5)

hist(
  sim.ok$pw, 
  breaks = breaks(sim.ok$pw), 
  freq = FALSE, 
  col = "orange", 
  border = "white", 
  ylim = c(0, 0.25), 
  xlab = "# mulheres promovidas", 
  ylab = "Density", 
  main = "Análise às Simulações"
)
points(
  11:24, 
  probs, 
  col = "purple", 
  pch = 16, 
  cex = 1.2
)

legend(
  "topright", 
  legend = c("Simulações", "Teórico"), 
  fill = c("orange", NA), 
  col = c(NA, "purple"), 
  pch = c(NA, 16),
  bty = 'n',
  box.lwd = FALSE,
  box.col = FALSE,
  border="white",
  bg = "transparent"
)

text(21.6, 0.21, "Bernardo", col="green")

# dev.off()