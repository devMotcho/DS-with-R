results_df <- read.csv("./results.csv", sep = ",")

# Calcular as taxas de promoção
taxas_df <- data.frame(
    taxa_pm = results_df$pm / 35,
    taxa_pw = results_df$pw / 35
)

taxas_df$diff <- taxas_df$taxa_pw - taxas_df$taxa_pm

jpeg("stripchart.jpeg", width = 600, height = 400)
stripchart(
    taxas_df$diff,
    method = "stack",
    offset = 0.4,
    pch = "o", at = 0,
    col = "cyan",
    bg = "cyan",
    main = "Diferenças nas taxas de promoção",
    xlab = "diferença (mulheres − homens)",
    cex = 1.5,
    cex.main = 2,
    cex.axis = 1.4,
    cex.lab = 1.4,
    xlim = c(-0.3, 0.3)
)
dev.off()

jpeg("diff_boxplot.jpeg", width = 600, height = 400)
boxplot(
    taxas_df$diff,
    main = "Diferenças nas taxas de promoção",
    xlab = "Diferença (mulheres − homens)",
    col = "cyan",
    border = "darkgray",
    horizontal = TRUE,
    pch = 16,
    las = 1,
    cex = 1.5,
    cex.main = 2,
    cex.axis = 1.4,
    cex.lab = 1.4
)
dev.off()

prom_w_df <- data.frame(
    sim_num = results_df$sim_num,
    pw = results_df$pw
)
sorted_df <- prom_w_df[order(prom_w_df$sim_num), ]

jpeg("prom_w_plot.jpeg", width = 600, height = 400)
plot(sorted_df$sim_num,
    sorted_df$pw,
    type = "b",
    col = "darkgray",
    pch = 21,
    bg = "cyan",
    main = "Resultados das simulações",
    xlab = "n simulação",
    ylab = "Mulheres Promovidas",
    cex = 1.5,
    cex.main = 2,
    cex.axis = 1.4,
    cex.lab = 1.4
)
dev.off()
