library(readr)

# Carregar os dados
results_summary <- read_csv("results_summary.csv")

# Visualizar estrutura dos dados
str(results_summary)
View(results_summary)

# Executar análise de variância
analise <- ExpDes.pt::fat2.dbc(results_summary$Linguagem,
                               results_summary$Nucleo,
                               results_summary$Memoria_RAM,
                               results_summary$Media_tempo_de_resposta,
                               quali = c(TRUE, TRUE),
                               fac.names = c("Linguagem", "Nucleo"))

# ============================================================================
# GRÁFICOS DE REGRESSÃO POR LINGUAGEM
# ============================================================================

# Calcular médias por linguagem e núcleo
medias <- aggregate(Media_tempo_de_resposta ~ Linguagem + Nucleo, 
                    data = results_summary, 
                    FUN = mean)

# Obter lista de linguagens únicas
linguagens <- unique(results_summary$Linguagem)

# Criar diretório para gráficos se não existir
if (!dir.exists("graficos")) {
  dir.create("graficos")
}

# Função para gerar gráfico de regressão para uma linguagem
gerar_grafico_regressao <- function(linguagem, dados_medias) {
  # Filtrar dados da linguagem
  dados_ling <- dados_medias[dados_medias$Linguagem == linguagem, ]
  
  # Ordenar por núcleo
  dados_ling <- dados_ling[order(dados_ling$Nucleo), ]
  
  # Variáveis
  x <- dados_ling$Nucleo
  y <- dados_ling$Media_tempo_de_resposta
  
  # Ajustar modelos
  modelo_linear <- lm(y ~ x)
  modelo_quadratico <- lm(y ~ x + I(x^2))
  modelo_cubico <- lm(y ~ x + I(x^2) + I(x^3))
  
  # Calcular R² para cada modelo
  r2_linear <- summary(modelo_linear)$r.squared
  r2_quadratico <- summary(modelo_quadratico)$r.squared
  r2_cubico <- summary(modelo_cubico)$r.squared
  
  # Sequência para curva suave
  x_seq <- seq(min(x), max(x), length.out = 100)
  
  # Previsões
  pred_linear <- predict(modelo_linear, newdata = data.frame(x = x_seq))
  pred_quadratico <- predict(modelo_quadratico, newdata = data.frame(x = x_seq))
  pred_cubico <- predict(modelo_cubico, newdata = data.frame(x = x_seq))
  
  # Criar gráfico
  png(filename = paste0("graficos/regressao_", gsub(" ", "_", linguagem), ".png"),
      width = 1200, height = 800, res = 150)
  
  # Plotar pontos observados
  plot(x, y, 
       main = paste("Efeito dos Núcleos -", linguagem),
       xlab = "Núcleos de CPU",
       ylab = "Tempo Médio de Resposta (s)",
       pch = 19,
       cex = 1.5,
       col = "black",
       ylim = c(0, max(y) * 1.2))
  
  # Adicionar curvas de regressão
  lines(x_seq, pred_linear, col = "blue", lwd = 2, lty = 1)
  lines(x_seq, pred_quadratico, col = "red", lwd = 2, lty = 2)
  lines(x_seq, pred_cubico, col = "green", lwd = 2, lty = 3)
  
  # Adicionar legenda
  legend("topright",
         legend = c("Pontos Observados",
                   paste0("Linear (R² = ", round(r2_linear, 4), ")"),
                   paste0("Quadrático (R² = ", round(r2_quadratico, 4), ")"),
                   paste0("Cúbico (R² = ", round(r2_cubico, 4), ")")),
         col = c("black", "blue", "red", "green"),
         pch = c(19, NA, NA, NA),
         lty = c(NA, 1, 2, 3),
         lwd = c(NA, 2, 2, 2),
         cex = 0.9)
  
  # Adicionar grid
  grid(col = "gray90", lty = "dotted")
  
  # Adicionar equações no gráfico
  coef_linear <- coef(modelo_linear)
  coef_quad <- coef(modelo_quadratico)
  coef_cub <- coef(modelo_cubico)
  
  # Texto com equações (posicionado no canto inferior esquerdo)
  texto_equacoes <- paste0(
    "Linear: y = ", round(coef_linear[1], 4), 
    ifelse(coef_linear[2] >= 0, " + ", " - "), 
    abs(round(coef_linear[2], 4)), "x\n",
    "Quadrático: y = ", round(coef_quad[1], 4),
    ifelse(coef_quad[2] >= 0, " + ", " - "),
    abs(round(coef_quad[2], 4)), "x",
    ifelse(coef_quad[3] >= 0, " + ", " - "),
    abs(round(coef_quad[3], 4)), "x²\n",
    "Cúbico: y = ", round(coef_cub[1], 4),
    ifelse(coef_cub[2] >= 0, " + ", " - "),
    abs(round(coef_cub[2], 4)), "x",
    ifelse(coef_cub[3] >= 0, " + ", " - "),
    abs(round(coef_cub[3], 4)), "x²",
    ifelse(coef_cub[4] >= 0, " + ", " - "),
    abs(round(coef_cub[4], 4)), "x³"
  )
  
  text(x = min(x), 
       y = max(y) * 0.15,
       labels = texto_equacoes,
       adj = c(0, 0),
       cex = 0.7,
       family = "mono",
       col = "darkgray")
  
  dev.off()
  
  # Retornar resumo dos modelos
  return(list(
    linguagem = linguagem,
    linear = list(modelo = modelo_linear, r2 = r2_linear),
    quadratico = list(modelo = modelo_quadratico, r2 = r2_quadratico),
    cubico = list(modelo = modelo_cubico, r2 = r2_cubico)
  ))
}

# Gerar gráficos para todas as linguagens
resultados_modelos <- list()

cat("\n=== Gerando gráficos de regressão ===\n")
for (ling in linguagens) {
  cat("Gerando gráfico para:", ling, "\n")
  resultados_modelos[[ling]] <- gerar_grafico_regressao(ling, medias)
}

cat("\n=== Gráficos gerados com sucesso! ===\n")
cat("Arquivos salvos em: graficos/\n\n")

# Resumo dos R² por linguagem
cat("=== Resumo dos Coeficientes de Determinação (R²) ===\n")
cat(sprintf("%-15s %10s %12s %10s\n", "Linguagem", "Linear", "Quadrático", "Cúbico"))
cat(paste(rep("-", 50), collapse = ""), "\n")
for (ling in linguagens) {
  r2_lin <- resultados_modelos[[ling]]$linear$r2
  r2_quad <- resultados_modelos[[ling]]$quadratico$r2
  r2_cub <- resultados_modelos[[ling]]$cubico$r2
  cat(sprintf("%-15s %10.4f %12.4f %10.4f\n", 
              ling, r2_lin, r2_quad, r2_cub))
}
cat("\n")

