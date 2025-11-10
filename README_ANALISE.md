# Guia de Interpretação dos Resultados da Análise Estatística / Statistical Analysis Results Interpretation Guide

## 📊 Resumo do Experimento / Experiment Summary

### 🇧🇷 Português

Foi realizado um experimento para comparar o desempenho de **10 linguagens de programação** diferentes sob diferentes configurações de hardware:

- **FATOR 1 - Linguagem**: C#, Go, Java, JavaScript, Laravel, PHP, Python, Ruby, Rust, Scala (10 níveis)
- **FATOR 2 - Núcleo**: 0.5, 1, 2 (3 níveis)
- **Bloco - Memoria_RAM**: 250MB, 500MB, 1000MB (3 níveis)
- **Variável Resposta**: Tempo médio de resposta (em segundos)

**Delineamento**: Em Blocos Casualizados (DBC) com 3 repetições por tratamento
**Total de observações**: 270 (10 × 3 × 3 × 3)

### 🇬🇧 English

An experiment was conducted to compare the performance of **10 different programming languages** under different hardware configurations:

- **FACTOR 1 - Language**: C#, Go, Java, JavaScript, Laravel, PHP, Python, Ruby, Rust, Scala (10 levels)
- **FACTOR 2 - Cores**: 0.5, 1, 2 (3 levels)
- **Block - RAM**: 250MB, 500MB, 1000MB (3 levels)
- **Response Variable**: Average response time (in seconds)

**Design**: Randomized Complete Block Design (RCBD) with 3 repetitions per treatment
**Total observations**: 270 (10 × 3 × 3 × 3)

---

## 📈 Parte 1: Análise de Variância (ANOVA) / Part 1: Variance Analysis (ANOVA)

### Quadro da ANOVA - Interpretação dos Testes de Significância / ANOVA Table - Significance Tests Interpretation

```
                  GL     SQ QM     Fc    Pr>Fc
Bloco              2   0.04  3    3.0 0.049467
Linguagem          9 375.85  6 6814.4 0.000000
Nucleo             2  26.74  4 2182.0 0.000000
Linguagem*Nucleo  18  48.78  5  442.2 0.000000
Residuo          238   1.46  2                
Total            269 452.87  1                
```

### 🇧🇷 Português

**Legenda**:
- **GL**: Graus de liberdade
- **SQ**: Soma de quadrados (variabilidade)
- **QM**: Quadrado médio (variância)
- **Fc**: Valor da estatística F calculada
- **Pr>Fc**: Valor-p (probabilidade)

### ✅ **Como Interpretar**:

- **Pr>Fc < 0.05**: Efeito **SIGNIFICATIVO** - há diferença real entre os tratamentos
- **Pr>Fc ≥ 0.05**: Efeito **NÃO SIGNIFICATIVO** - não há diferença estatisticamente comprovada

### 📋 **Conclusões da ANOVA**:

1. ✅ **Bloco** (Pr>Fc = 0.049467): **SIGNIFICATIVO**
   - O efeito de bloco é significativo, indicando que o controle de blocos foi importante
   - Fc = 3.0 (efeito moderado)
   - Justifica o uso do delineamento em blocos casualizados (DBC)

2. ✅ **Linguagem** (Pr>Fc = 0): **ALTAMENTE SIGNIFICATIVO**
   - Diferentes linguagens produzem tempos de resposta significativamente diferentes
   - Fc = 6814.4 (efeito muito forte)

3. ✅ **Núcleo** (Pr>Fc = 0): **ALTAMENTE SIGNIFICATIVO**
   - O número de núcleos (0.5, 1, 2) afeta significativamente o desempenho
   - Fc = 2182.0 (efeito muito forte)

4. ✅ **Linguagem × Núcleo** (Pr>Fc = 0): **ALTAMENTE SIGNIFICATIVO**
   - ⚠️ **IMPORTANTE**: O efeito dos núcleos depende da linguagem escolhida!
   - Isso significa que cada linguagem responde de forma diferente ao aumento de núcleos
   - Fc = 442.2 (efeito muito forte)

### 📊 **Coeficiente de Variação (CV)**
- **CV = 10.11%**
- Indicador da variabilidade relativa dos dados
- CV < 15% indica **boa precisão experimental** ✅

### ⚠️ **Teste de Normalidade dos Resíduos**
```
valor-p: 9.402239e-19
ATENÇÃO: os resíduos NÃO são normais!
```
- Valores-p muito pequenos (< 0.05) indicam violação da normalidade
- **Impacto**: Os testes são robustos para ANOVA, mas deve-se ter cautela na interpretação

### 🇬🇧 English

**Legend**:
- **GL**: Degrees of freedom
- **SQ**: Sum of squares (variability)
- **QM**: Mean square (variance)
- **Fc**: Calculated F statistic value
- **Pr>Fc**: P-value (probability)

### ✅ **How to Interpret**:

- **Pr>Fc < 0.05**: Effect is **SIGNIFICANT** - there is a real difference between treatments
- **Pr>Fc ≥ 0.05**: Effect is **NOT SIGNIFICANT** - no statistically proven difference

### 📋 **ANOVA Conclusions**:

1. ✅ **Block** (Pr>Fc = 0.049467): **SIGNIFICANT**
   - The block effect is significant, indicating that block control was important
   - Fc = 3.0 (moderate effect)
   - Justifies the use of randomized complete block design (RCBD)

2. ✅ **Language** (Pr>Fc = 0): **HIGHLY SIGNIFICANT**
   - Different languages produce significantly different response times
   - Fc = 6814.4 (very strong effect)

3. ✅ **Cores** (Pr>Fc = 0): **HIGHLY SIGNIFICANT**
   - The number of cores (0.5, 1, 2) significantly affects performance
   - Fc = 2182.0 (very strong effect)

4. ✅ **Language × Cores** (Pr>Fc = 0): **HIGHLY SIGNIFICANT**
   - ⚠️ **IMPORTANT**: The effect of cores depends on the chosen language!
   - This means each language responds differently to increasing cores
   - Fc = 442.2 (very strong effect)

### 📊 **Coefficient of Variation (CV)**
- **CV = 10.11%**
- Indicator of relative data variability
- CV < 15% indicates **good experimental precision** ✅

### ⚠️ **Residual Normality Test**
```
p-value: 9.402239e-19
WARNING: residuals are NOT normal!
```
- Very small p-values (< 0.05) indicate violation of normality
- **Impact**: Tests are robust for ANOVA, but caution should be taken in interpretation

---

## 🔍 Parte 2: Desdobramento da Interação Linguagem × Núcleo / Part 2: Language × Cores Interaction Breakdown

### 🇧🇷 Português

Como a interação Linguagem × Núcleo é significativa, precisamos analisar o comportamento de cada linguagem em relação aos núcleos.

### 📊 2.1 Comparação entre Linguagens dentro de cada nível de Núcleo

#### **Com 0.5 Núcleo** (Performance Geral)
```
a 	 Laravel 	 4.996667    ← PIOR (5 segundos)
 b 	 Ruby 	 2.655556 
  c 	 Python 	 1.217778 
  c 	 PHP 	 1.156316 
   d 	 Java 	 0.6925244 
    e 	 JavaScript 	 0.4816867 
     f 	 C# 	 0.2771022 
      g 	 Go 	 0.1440567 
      gh 	 Scala 	 0.09315333 
       h 	 Rust 	 0.02151778    ← MELHOR (0.02 segundos)
```
**Interpretação**: Letras diferentes indicam desempenhos significativamente diferentes. Rust é ~232 vezes mais rápido que Laravel!

#### **Com 1 Núcleo**
```
a 	 Laravel 	 4.992222    ← PIOR
 b 	 Ruby 	 0.9838911 
  c 	 Python 	 0.4670822 
   d 	 PHP 	 0.2726578 
   d 	 Java 	 0.2696611 
   de 	 C# 	 0.1850256 
    ef 	 JavaScript 	 0.1050456 
    ef 	 Go 	 0.09730333 
     f 	 Scala 	 0.06118556 
     f 	 Rust 	 0.02084556    ← MELHOR
```
**Interpretação**: Com 1 núcleo, Rust permanece sendo o mais rápido. Laravel permanece sendo o mais lento.

#### **Com 2 Núcleos**
```
a 	 Laravel 	 2.372222    ← PIOR
 b 	 Ruby 	 0.4812 
 b 	 Python 	 0.4529689 
  c 	 PHP 	 0.2623111 
   d 	 C# 	 0.1155067 
   d 	 Go 	 0.1033022 
   d 	 JavaScript 	 0.09353111 
   d 	 Java 	 0.08598111 
   d 	 Scala 	 0.05479111 
   d 	 Rust 	 0.02184333    ← MELHOR
```
**Interpretação**: Com 2 núcleos, a maioria das linguagens (C#, Go, JavaScript, Java, Scala, Rust) tem desempenho estatisticamente similar (~0.05-0.12s). Rust permanece o mais rápido.

### 🎯 **Principais Descobertas**:
1. **Rust é consistentemente a linguagem mais rápida** em todas as configurações
2. **Laravel é consistentemente a linguagem mais lenta** em todas as configurações
3. **Com 2 núcleos**, várias linguagens têm desempenho estatisticamente equivalente
4. **Ruby e Python melhoram com mais núcleos** (redução de 2.6s para 0.5s)
5. **Scala apresenta bom desempenho**, especialmente com mais núcleos

### 🇬🇧 English

Since the Language × Cores interaction is significant, we need to analyze the behavior of each language in relation to cores.

### 📊 2.1 Language Comparison within each Core Level

#### **With 0.5 Core** (General Performance)
```
a 	 Laravel 	 4.996667    ← WORST (5 seconds)
 b 	 Ruby 	 2.655556 
  c 	 Python 	 1.217778 
  c 	 PHP 	 1.156316 
   d 	 Java 	 0.6925244 
    e 	 JavaScript 	 0.4816867 
     f 	 C# 	 0.2771022 
      g 	 Go 	 0.1440567 
      gh 	 Scala 	 0.09315333 
       h 	 Rust 	 0.02151778    ← BEST (0.02 seconds)
```
**Interpretation**: Different letters indicate significantly different performances. Rust is ~232 times faster than Laravel!

#### **With 1 Core**
```
a 	 Laravel 	 4.992222    ← WORST
 b 	 Ruby 	 0.9838911 
  c 	 Python 	 0.4670822 
   d 	 PHP 	 0.2726578 
   d 	 Java 	 0.2696611 
   de 	 C# 	 0.1850256 
    ef 	 JavaScript 	 0.1050456 
    ef 	 Go 	 0.09730333 
     f 	 Scala 	 0.06118556 
     f 	 Rust 	 0.02084556    ← BEST
```
**Interpretation**: With 1 core, Rust remains the fastest. Laravel remains the slowest.

#### **With 2 Cores**
```
a 	 Laravel 	 2.372222    ← WORST
 b 	 Ruby 	 0.4812 
 b 	 Python 	 0.4529689 
  c 	 PHP 	 0.2623111 
   d 	 C# 	 0.1155067 
   d 	 Go 	 0.1033022 
   d 	 JavaScript 	 0.09353111 
   d 	 Java 	 0.08598111 
   d 	 Scala 	 0.05479111 
   d 	 Rust 	 0.02184333    ← BEST
```
**Interpretation**: With 2 cores, most languages (C#, Go, JavaScript, Java, Scala, Rust) have statistically similar performance (~0.05-0.12s). Rust remains the fastest.

### 🎯 **Main Findings**:
1. **Rust is consistently the fastest language** in all configurations
2. **Laravel is consistently the slowest language** in all configurations
3. **With 2 cores**, several languages have statistically equivalent performance
4. **Ruby and Python improve with more cores** (reduction from 2.6s to 0.5s)
5. **Scala shows good performance**, especially with more cores

---

## 📉 Parte 3: Análise de Regressão - Efeito dos Núcleos por Linguagem / Part 3: Regression Analysis - Cores Effect by Language

### 🇧🇷 Português

Para cada linguagem, foi ajustado um modelo polinomial para entender como o número de núcleos afeta o desempenho.

### 📊 **C# - Ajuste Linear**
- **R² = 0.928573** (92.86% da variabilidade explicada)
- **Coeficientes**: b0 = 0.3119, b1 = -0.1023
- **Interpretação**: Redução de ~0.1s por núcleo adicional
- **Efeito**: SIGNIFICATIVO ✅

### 🦫 **Go - Sem Diferença Significativa**
```
Medias:
  0.5 núcleo: 0.144s
  1 núcleo:   0.097s
  2 núcleos:  0.103s
```
- **Interpretação**: Número de núcleos NÃO afeta significativamente o desempenho do Go
- Go já é tão otimizado que núcleos extras não ajudam muito

### ☕ **Java - Redução Linear Forte**
- **R² = 0.838189** (83.82% da variabilidade explicada)
- **Coeficientes**: b0 = 0.7844, b1 = -0.3728
- **Interpretação**: Redução de ~0.37s por núcleo adicional
- **Efeito**: MUITO SIGNIFICATIVO ✅
- Com 2 núcleos, Java melhora drasticamente (de 0.78s para ~0.04s)

### 🟨 **JavaScript - Redução Moderada**
- **R² = 0.597123** (59.71% da variabilidade explicada)
- **Coeficientes**: b0 = 0.4874, b1 = -0.2234
- **Interpretação**: Redução de ~0.22s por núcleo adicional
- **Efeito**: SIGNIFICATIVO ✅

### 🐘 **PHP - Redução Muito Forte (mas ainda lento)**
- **R² = 0.893763** (89.38% da variabilidade explicada)
- **Coeficientes**: b0 = 6.3067, b1 = -1.8740
- **Interpretação**: Redução de ~1.87s por núcleo adicional
- **Com 2 núcleos**: PHP melhora de ~5s para ~2.4s, mas ainda é lento
- **Efeito**: MUITO SIGNIFICATIVO ✅
- ⚠️ **OBSERVAÇÃO IMPORTANTE**: Em configurações com 0.5 e 1 núcleo, PHP não completou as 100.000 requisições dentro do limite de 10 minutos
  - **0.5 núcleo**: ~60.000 requisições completas, ~40.000 "dropped" (timeout)
  - **1 núcleo**: ~60.000 requisições completas, ~40.000 "dropped" (timeout)
  - **2 núcleos**: 100.000 requisições completas
  - Isto demonstra o quão lento PHP é em configurações com poucos núcleos

### 🐍 **Python - Redução Moderada**
- **R² = 0.587352** (58.74% da variabilidade explicada)
- **Coeficientes**: b0 = 1.2248, b1 = -0.4390
- **Interpretação**: Redução de ~0.44s por núcleo adicional
- **Efeito**: SIGNIFICATIVO ✅
- A Melhoria quadrática é significativa (melhor ajuste com 2 núcleos)

### 💎 **Ruby - Redução Muito Forte**
- **R² = 0.777605** (77.76% da variabilidade explicada)
- **Coeficientes**: b0 = 2.9069, b1 = -1.3143
- **Interpretação**: Redução de ~1.31s por núcleo adicional
- **Efeito**: MUITO SIGNIFICATIVO ✅
- **Com 2 núcleos**: Ruby melhora dramaticamente (de 2.9s para ~0.5s)

### 🦀 **Rust - Sem Diferença Significativa**
```
Medias:
  0.5 núcleo: 0.0215s
  1 núcleo:   0.0208s
  2 núcleos:  0.0218s
```
- **Interpretação**: Número de núcleos NÃO afeta significativamente o desempenho do Rust
- Rust é tão otimizado que já tem desempenho máximo com qualquer número de núcleos
- **Pr>Fc = 0.9996** (não significativo)

### 🦫 **Go - Sem Diferença Significativa**
```
Medias:
  0.5 núcleo: 0.144s
  1 núcleo:   0.097s
  2 núcleos:  0.103s
```
- **Interpretação**: Número de núcleos NÃO afeta significativamente o desempenho do Go
- Go já é tão otimizado que núcleos extras não ajudam muito
- **Pr>Fc = 0.3881** (não significativo)

### ⚡ **Scala - Sem Diferença Significativa**
```
Medias:
  0.5 núcleo: 0.093s
  1 núcleo:   0.061s
  2 núcleos:  0.055s
```
- **Interpretação**: Número de núcleos NÃO afeta significativamente o desempenho do Scala
- Scala apresenta bom desempenho consistente independente do número de núcleos
- **Pr>Fc = 0.5386** (não significativo)

### 🇬🇧 English

For each language, a polynomial model was fitted to understand how the number of cores affects performance.

### 📊 **C# - Linear Fit**
- **R² = 0.928573** (92.86% of variability explained)
- **Coefficients**: b0 = 0.3119, b1 = -0.1023
- **Interpretation**: Reduction of ~0.1s per additional core
- **Effect**: SIGNIFICANT ✅

### 🦫 **Go - No Significant Difference**
```
Means:
  0.5 core: 0.144s
  1 core:   0.097s
  2 cores:  0.103s
```
- **Interpretation**: Number of cores does NOT significantly affect Go performance
- Go is so optimized that extra cores don't help much

### ☕ **Java - Strong Linear Reduction**
- **R² = 0.838189** (83.82% of variability explained)
- **Coefficients**: b0 = 0.7844, b1 = -0.3728
- **Interpretation**: Reduction of ~0.37s per additional core
- **Effect**: HIGHLY SIGNIFICANT ✅
- With 2 cores, Java improves drastically (from 0.78s to ~0.04s)

### 🟨 **JavaScript - Moderate Reduction**
- **R² = 0.597123** (59.71% of variability explained)
- **Coefficients**: b0 = 0.4874, b1 = -0.2234
- **Interpretation**: Reduction of ~0.22s per additional core
- **Effect**: SIGNIFICANT ✅

### 🐘 **PHP - Very Strong Reduction (but still slow)**
- **R² = 0.893763** (89.38% of variability explained)
- **Coefficients**: b0 = 6.3067, b1 = -1.8740
- **Interpretation**: Reduction of ~1.87s per additional core
- **With 2 cores**: PHP improves from ~5s to ~2.4s, but still slow
- **Effect**: HIGHLY SIGNIFICANT ✅
- ⚠️ **IMPORTANT NOTE**: With 0.5 and 1 core configurations, PHP did not complete 100,000 requests within the 10-minute limit
  - **0.5 core**: ~60,000 completed requests, ~40,000 "dropped" (timeout)
  - **1 core**: ~60,000 completed requests, ~40,000 "dropped" (timeout)
  - **2 cores**: 100,000 completed requests
  - This demonstrates how slow PHP is with few cores

### 🐍 **Python - Moderate Reduction**
- **R² = 0.587352** (58.74% of variability explained)
- **Coefficients**: b0 = 1.2248, b1 = -0.4390
- **Interpretation**: Reduction of ~0.44s per additional core
- **Effect**: SIGNIFICANT ✅
- Quadratic improvement is significant (better fit with 2 cores)

### 💎 **Ruby - Very Strong Reduction**
- **R² = 0.777605** (77.76% of variability explained)
- **Coefficients**: b0 = 2.9069, b1 = -1.3143
- **Interpretation**: Reduction of ~1.31s per additional core
- **Effect**: HIGHLY SIGNIFICANT ✅
- **With 2 cores**: Ruby improves dramatically (from 2.9s to ~0.5s)

### 🦀 **Rust - No Significant Difference**
```
Means:
  0.5 core: 0.0215s
  1 core:   0.0208s
  2 cores:  0.0218s
```
- **Interpretation**: Number of cores does NOT significantly affect Rust performance
- Rust is so optimized that it already has maximum performance with any number of cores
- **Pr>Fc = 0.9996** (not significant)

### 🦫 **Go - No Significant Difference**
```
Means:
  0.5 core: 0.144s
  1 core:   0.097s
  2 cores:  0.103s
```
- **Interpretation**: Number of cores does NOT significantly affect Go performance
- Go is so optimized that extra cores don't help much
- **Pr>Fc = 0.3881** (not significant)

### ⚡ **Scala - No Significant Difference**
```
Means:
  0.5 core: 0.093s
  1 core:   0.061s
  2 cores:  0.055s
```
- **Interpretation**: Number of cores does NOT significantly affect Scala performance
- Scala shows good consistent performance regardless of number of cores
- **Pr>Fc = 0.5386** (not significant)

---

## 🎯 Parte 4: Análise do Efeito dos Núcleos por Linguagem / Part 4: Cores Effect Analysis by Language

### 🇧🇷 Português

A análise do desdobramento mostra como cada linguagem responde ao número de núcleos:

#### **Linguagens com Efeito Significativo dos Núcleos**:

- **C#**: Redução significativa (Pr>Fc = 1e-04)
  - 0.5 núcleo: 0.277s → 1 núcleo: 0.185s → 2 núcleos: 0.116s
  
- **Java**: Redução muito forte (Pr>Fc = 0)
  - 0.5 núcleo: 0.693s → 1 núcleo: 0.270s → 2 núcleos: 0.086s
  
- **JavaScript**: Redução significativa (Pr>Fc = 0)
  - 0.5 núcleo: 0.482s → 1 núcleo: 0.105s → 2 núcleos: 0.094s
  
- **Laravel**: Redução muito forte (Pr>Fc = 0)
  - 0.5 núcleo: 4.997s → 1 núcleo: 4.992s → 2 núcleos: 2.372s
  
- **PHP**: Redução muito forte (Pr>Fc = 0)
  - 0.5 núcleo: 1.156s → 1 núcleo: 0.273s → 2 núcleos: 0.262s
  
- **Python**: Redução significativa (Pr>Fc = 0)
  - 0.5 núcleo: 1.218s → 1 núcleo: 0.467s → 2 núcleos: 0.453s
  
- **Ruby**: Redução muito forte (Pr>Fc = 0)
  - 0.5 núcleo: 2.656s → 1 núcleo: 0.984s → 2 núcleos: 0.481s

#### **Linguagens SEM Efeito Significativo dos Núcleos**:

- **Go**: Pr>Fc = 0.3881 (não significativo)
- **Rust**: Pr>Fc = 0.9996 (não significativo)
- **Scala**: Pr>Fc = 0.5386 (não significativo)

### 🇬🇧 English

The breakdown analysis shows how each language responds to the number of cores:

#### **Languages with Significant Cores Effect**:

- **C#**: Significant reduction (Pr>Fc = 1e-04)
  - 0.5 core: 0.277s → 1 core: 0.185s → 2 cores: 0.116s
  
- **Java**: Very strong reduction (Pr>Fc = 0)
  - 0.5 core: 0.693s → 1 core: 0.270s → 2 cores: 0.086s
  
- **JavaScript**: Significant reduction (Pr>Fc = 0)
  - 0.5 core: 0.482s → 1 core: 0.105s → 2 cores: 0.094s
  
- **Laravel**: Very strong reduction (Pr>Fc = 0)
  - 0.5 core: 4.997s → 1 core: 4.992s → 2 cores: 2.372s
  
- **PHP**: Very strong reduction (Pr>Fc = 0)
  - 0.5 core: 1.156s → 1 core: 0.273s → 2 cores: 0.262s
  
- **Python**: Significant reduction (Pr>Fc = 0)
  - 0.5 core: 1.218s → 1 core: 0.467s → 2 cores: 0.453s
  
- **Ruby**: Very strong reduction (Pr>Fc = 0)
  - 0.5 core: 2.656s → 1 core: 0.984s → 2 cores: 0.481s

#### **Languages WITHOUT Significant Cores Effect**:

- **Go**: Pr>Fc = 0.3881 (not significant)
- **Rust**: Pr>Fc = 0.9996 (not significant)
- **Scala**: Pr>Fc = 0.5386 (not significant)

---

## 📊 Resumo Executivo - Principais Conclusões / Executive Summary - Main Conclusions

### 🏆 **Ranking de Performance (Resumo) / Performance Ranking (Summary)**:

#### **Top 3 Mais Rápidas / Top 3 Fastest**:
1. 🦀 **Rust** - ~0.021s (34-40x mais rápido que a média / 34-40x faster than average)
2. ⚡ **Scala** - ~0.05-0.09s (com 2 núcleos / with 2 cores)
3. 🦫 **Go** - ~0.10s

#### **Bottom 3 Mais Lentas / Bottom 3 Slowest**:
1. 🐘 **Laravel** - ~4-5s com 0.5-1 núcleo, ~2.4s com 2 núcleos / ~4-5s with 0.5-1 core, ~2.4s with 2 cores
2. 💎 **Ruby** - ~2.6s com 0.5 núcleo, melhora para ~0.5s com 2 núcleos / ~2.6s with 0.5 core, improves to ~0.5s with 2 cores
3. 🐍 **Python** - ~1.2s com 0.5 núcleo, melhora para ~0.45s com 2 núcleos / ~1.2s with 0.5 core, improves to ~0.45s with 2 cores

### 💡 **Insights Importantes / Important Insights**:

1. **Núcleos são importantes / Cores are important** para / for: Laravel, PHP, Ruby, Python, Java, JavaScript, C#
   - Linguagens interpretadas se beneficiam MUITO de mais núcleos / Interpreted languages benefit GREATLY from more cores

2. **Núcleos são irrelevantes / Cores are irrelevant** para / for: Rust, Go, Scala
   - Compiladas com alta otimização não se beneficiam tanto / Highly optimized compiled languages don't benefit as much

3. **Bloco (RAM) é significativo / Block (RAM) is significant** (Pr>Fc = 0.049467)
   - A quantidade de RAM usada como bloco foi importante para reduzir a variabilidade experimental / The amount of RAM used as block was important to reduce experimental variability
   - Justifica o uso do delineamento em blocos casualizados (DBC) / Justifies the use of randomized complete block design (RCBD)
   - As diferentes quantidades de RAM (250MB, 500MB, 1000MB) causam variação significativa entre blocos / Different amounts of RAM (250MB, 500MB, 1000MB) cause significant variation between blocks

4. **Linguagem × Núcleo interagem / Language × Cores interact**:
   - Cada linguagem responde de forma diferente ao número de núcleos / Each language responds differently to the number of cores
   - Linguagens mais lentas se beneficiam mais dos núcleos extras / Slower languages benefit more from extra cores

5. **Rust é superior / Rust is superior** em todos os cenários / in all scenarios
   - Performance consistente independente de configuração / Consistent performance regardless of configuration
   - Código compilado nativamente otimizado / Native optimized compiled code

### 📈 **Recomendações Práticas / Practical Recommendations**:

- **Para máxima performance / For maximum performance**: Use **Rust** (rápido em qualquer configuração / fast in any configuration)
- **Para desenvolvimento rápido com bom desempenho / For rapid development with good performance**: Use **Go**, **Scala** or **C#**
- **Para linguagens interpretadas / For interpreted languages**: Use pelo menos / use at least **2 núcleos / cores** para obter melhor desempenho / to obtain better performance
- **Evite Laravel / Avoid Laravel** para tarefas de CPU intensivas / for CPU-intensive tasks: É / It is 100-200x mais lento que Rust / slower than Rust
- **Scala apresenta excelente desempenho / Scala shows excellent performance**: Especialmente com múltiplos núcleos / Especially with multiple cores

---

## 📚 Glossário / Glossary

### 🇧🇷 Português

- **CV (Coeficiente de Variação)**: Medida de variabilidade relativa (CV < 15% = bom)
- **Fc**: Estatística F calculada (quanto maior, mais forte o efeito)
- **Pr>Fc (valor-p)**: Probabilidade de obter o resultado por acaso
- **R²**: Coeficiente de determinação (proporção da variabilidade explicada)
- **GL (Graus de Liberdade)**: Quantidade de informações independentes
- **Significativo**: Diferença real comprovada estatisticamente (não é por acaso)
- **DBC**: Delineamento em Blocos Casualizados (tratamentos distribuídos aleatoriamente dentro de blocos)

### 🇬🇧 English

- **CV (Coefficient of Variation)**: Measure of relative variability (CV < 15% = good)
- **Fc**: Calculated F statistic (the higher, the stronger the effect)
- **Pr>Fc (p-value)**: Probability of obtaining the result by chance
- **R²**: Coefficient of determination (proportion of explained variability)
- **GL (Degrees of Freedom)**: Amount of independent information
- **Significant**: Real difference statistically proven (not by chance)
- **RCBD**: Randomized Complete Block Design (treatments randomly distributed within blocks)
