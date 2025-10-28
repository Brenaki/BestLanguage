library(readr)

# Carregar os dados
results_summary <- read_csv("results_summary.csv")

# Visualizar estrutura dos dados
str(results_summary)
View(results_summary)

# Executar análise de variância
analise <- ExpDes.pt::fat3.dic(
  fator1 = results_summary$Linguagem,
  fator2 = results_summary$Memoria_RAM,
  fator3 = results_summary$Nucleo,
  resp = results_summary$Media_tempo_de_resposta,
  quali = c(TRUE, FALSE, FALSE),
  fac.names = c("Linguagem", "RAM", "Nucleo")
)

# ========================================
# GRÁFICOS DE REGRESSÃO POR LINGUAGEM
# ========================================

# Configurar parâmetros de plotagem
par(mfrow = c(2, 4), mar = c(5, 4, 3, 2))

# ========================================
# 1. C# - Modelo Linear
# ========================================
x_csharp <- c(0.5, 1, 2)
m_csharp <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                     data = results_summary[results_summary$Linguagem == "C#", ], 
                     FUN = mean)$Media_tempo_de_resposta

plot(x_csharp, m_csharp, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "C# - Núcleos X Tempo", pch = 19)
# Modelo linear: Y = 0.3119 - 0.1023x
curve(0.3119 - 0.1023*x, add = T)
text(1.5, 0.25, "Y = 0.3119 - 0.1023x\nR² = 0.9286")

# ========================================
# 2. Java - Modelo Quadrático
# ========================================
x_java <- c(0.5, 1, 2)
m_java <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                   data = results_summary[results_summary$Linguagem == "Java", ], 
                   FUN = mean)$Media_tempo_de_resposta

plot(x_java, m_java, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "Java - Núcleos X Tempo", pch = 19)
# Modelo linear
curve(0.7844 - 0.3728*x, add = T)
# Modelo quadrático: Y = 1.3361 - 1.5078x + 0.4414x²
curve(1.3361 - 1.5078*x + 0.4414*x^2, add = T, col = 2)
text(1.5, 0.6, "Y = 0.7844 - 0.3728x\nR² = 0.8382")
text(1.5, 0.4, "Y = 1.3361 - 1.5078x + 0.4414x²\nR² = 1", col = 2)

# ========================================
# 3. JavaScript - Modelo Quadrático
# ========================================
x_js <- c(0.5, 1, 2)
m_js <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                 data = results_summary[results_summary$Linguagem == "JavaScript", ], 
                 FUN = mean)$Media_tempo_de_resposta

plot(x_js, m_js, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "JavaScript - Núcleos X Tempo", pch = 19)
# Modelo linear
curve(0.4874 - 0.2234*x, add = T)
# Modelo quadrático: Y = 1.1056 - 1.4950x + 0.4945x²
curve(1.1056 - 1.4950*x + 0.4945*x^2, add = T, col = 2)
text(1.5, 0.4, "Y = 0.4874 - 0.2234x\nR² = 0.5971")
text(1.5, 0.25, "Y = 1.1056 - 1.4950x + 0.4945x²\nR² = 1", col = 2)

# ========================================
# 4. PHP - Modelo Quadrático
# ========================================
x_php <- c(0.5, 1, 2)
m_php <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                  data = results_summary[results_summary$Linguagem == "PHP", ], 
                  FUN = mean)$Media_tempo_de_resposta

plot(x_php, m_php, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "PHP - Núcleos X Tempo", pch = 19)
# Modelo linear
curve(6.3067 - 1.8740*x, add = T)
# Modelo quadrático: Y = 4.1307 + 2.6022x - 1.7407x²
curve(4.1307 + 2.6022*x - 1.7407*x^2, add = T, col = 2)
text(1.5, 4.5, "Y = 6.3067 - 1.8740x\nR² = 0.8938")
text(1.5, 3.5, "Y = 4.1307 + 2.6022x - 1.7407x²\nR² = 1", col = 2)

# ========================================
# 5. Python - Modelo Quadrático
# ========================================
x_python <- c(0.5, 1, 2)
m_python <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                     data = results_summary[results_summary$Linguagem == "Python", ], 
                     FUN = mean)$Media_tempo_de_resposta

plot(x_python, m_python, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "Python - Núcleos X Tempo", pch = 19)
# Modelo linear
curve(1.2248 - 0.4390*x, add = T)
# Modelo quadrático: Y = 2.4642 - 2.9887x + 0.9915x²
curve(2.4642 - 2.9887*x + 0.9915*x^2, add = T, col = 2)
text(1.5, 0.8, "Y = 1.2248 - 0.4390x\nR² = 0.5874")
text(1.5, 0.5, "Y = 2.4642 - 2.9887x + 0.9915x²\nR² = 1", col = 2)

# ========================================
# 6. Ruby - Modelo Quadrático
# ========================================
x_ruby <- c(0.5, 1, 2)
m_ruby <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                   data = results_summary[results_summary$Linguagem == "Ruby", ], 
                   FUN = mean)$Media_tempo_de_resposta

plot(x_ruby, m_ruby, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "Ruby - Núcleos X Tempo", pch = 19)
# Modelo linear
curve(2.9069 - 1.3143*x, add = T)
# Modelo quadrático: Y = 5.2741 - 6.1840x + 1.8938x²
curve(5.2741 - 6.1840*x + 1.8938*x^2, add = T, col = 2)
text(1.5, 2.2, "Y = 2.9069 - 1.3143x\nR² = 0.7776")
text(1.5, 1.5, "Y = 5.2741 - 6.1840x + 1.8938x²\nR² = 1", col = 2)

# ========================================
# 7. Go - Sem regressão (sem diferença significativa)
# ========================================
x_go <- c(0.5, 1, 2)
m_go <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                data = results_summary[results_summary$Linguagem == "Go", ], 
                FUN = mean)$Media_tempo_de_resposta

plot(x_go, m_go, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "Go - Núcleos X Tempo", pch = 19)
# Linha horizontal mostrando que não há diferença
abline(h = mean(m_go), col = 2, lty = 2)
text(1.5, max(m_go) + 0.02, "Sem diferença significativa", col = 2)

# ========================================
# 8. Rust - Sem regressão (sem diferença significativa)
# ========================================
x_rust <- c(0.5, 1, 2)
m_rust <- aggregate(Media_tempo_de_resposta ~ Nucleo, 
                   data = results_summary[results_summary$Linguagem == "Rust", ], 
                   FUN = mean)$Media_tempo_de_resposta

plot(x_rust, m_rust, xlab = "Núcleos", ylab = "Tempo (s)",
     main = "Rust - Núcleos X Tempo", pch = 19)
# Linha horizontal mostrando que não há diferença
abline(h = mean(m_rust), col = 2, lty = 2)
text(1.5, max(m_rust) + 0.002, "Sem diferença significativa", col = 2)

# Retornar parâmetros de plotagem ao normal
par(mfrow = c(1, 1))

