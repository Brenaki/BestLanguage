# Guia de Interpretação dos Resultados da Análise Estatística / Statistical Analysis Results Interpretation Guide

## 📊 Resumo do Experimento / Experiment Summary

### 🇧🇷 Português

Foi realizado um experimento para comparar o desempenho de **8 linguagens de programação** diferentes sob diferentes configurações de hardware:

- **FATOR 1 - Linguagem**: C#, Go, Java, JavaScript, PHP, Python, Ruby, Rust (8 níveis)
- **FATOR 2 - RAM**: 250MB, 500MB, 1000MB (3 níveis)
- **FATOR 3 - Núcleo**: 0.5, 1, 2 (3 níveis)
- **Variável Resposta**: Tempo médio de resposta (em segundos)

**Delinamento**: Inteiramente Casualizado (DIC) com 3 repetições por tratamento
**Total de observações**: 216 (8 × 3 × 3 × 3)

### 🇬🇧 English

An experiment was conducted to compare the performance of **8 different programming languages** under different hardware configurations:

- **FACTOR 1 - Language**: C#, Go, Java, JavaScript, PHP, Python, Ruby, Rust (8 levels)
- **FACTOR 2 - RAM**: 250MB, 500MB, 1000MB (3 levels)
- **FACTOR 3 - Cores**: 0.5, 1, 2 (3 levels)
- **Response Variable**: Average response time (in seconds)

**Design**: Completely Randomized Design (CRD) with 3 repetitions per treatment
**Total observations**: 216 (8 × 3 × 3 × 3)

---

## 📈 Parte 1: Análise de Variância (ANOVA) / Part 1: Variance Analysis (ANOVA)

### Quadro da ANOVA - Interpretação dos Testes de Significância / ANOVA Table - Significance Tests Interpretation

```
                      GL        SQ       QM       Fc  Pr>Fc
Linguagem              7 358.40964 51.20138 7400.755      0
RAM                    2   0.01866  0.00933   1.3486 0.2629
Nucleo                 2  25.70758 12.85379 1857.914      0
Linguagem*RAM         14   0.07434  0.00531   0.7675 0.7026
Linguagem*Nucleo      14  45.06901  3.21922 465.3121      0
RAM*Nucleo             4   0.01372  0.00343   0.4958 0.7388
Linguagem*RAM*Nucleo  28   0.12449  0.00445   0.6427 0.9143
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

1. ✅ **Linguagem** (Pr>Fc = 0): **ALTAMENTE SIGNIFICATIVO**
   - Diferentes linguagens produzem tempos de resposta significativamente diferentes
   - Fc = 7400.755 (efeito muito forte)

2. ❌ **RAM** (Pr>Fc = 0.2629): **NÃO SIGNIFICATIVO**
   - A quantidade de RAM (250MB, 500MB, 1000MB) NÃO causa diferença significativa
   - Fc = 1.3486 (efeito fraco)

3. ✅ **Núcleo** (Pr>Fc = 0): **ALTAMENTE SIGNIFICATIVO**
   - O número de núcleos (0.5, 1, 2) afeta significativamente o desempenho
   - Fc = 1857.914 (efeito muito forte)

4. ❌ **Linguagem × RAM** (Pr>Fc = 0.7026): **NÃO SIGNIFICATIVO**
   - Não há interação entre linguagem e RAM

5. ✅ **Linguagem × Núcleo** (Pr>Fc = 0): **SIGNIFICATIVO**
   - ⚠️ **IMPORTANTE**: O efeito dos núcleos depende da linguagem escolhida!
   - Isso significa que cada linguagem responde de forma diferente ao aumento de núcleos

6. ❌ **RAM × Núcleo** (Pr>Fc = 0.7388): **NÃO SIGNIFICATIVO**
   - Não há interação entre RAM e número de núcleos

7. ❌ **Linguagem × RAM × Núcleo** (Pr>Fc = 0.9143): **NÃO SIGNIFICATIVO**
   - Interação tripla não é significativa

### 📊 **Coeficiente de Variação (CV)**
- **CV = 9.36%**
- Indicador da variabilidade relativa dos dados
- CV < 15% indica **boa precisão experimental** ✅

### ⚠️ **Teste de Normalidade dos Resíduos**
```
valor-p: 5.845355e-19
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

1. ✅ **Language** (Pr>Fc = 0): **HIGHLY SIGNIFICANT**
   - Different languages produce significantly different response times
   - Fc = 7400.755 (very strong effect)

2. ❌ **RAM** (Pr>Fc = 0.2629): **NOT SIGNIFICANT**
   - The amount of RAM (250MB, 500MB, 1000MB) does NOT cause a significant difference
   - Fc = 1.3486 (weak effect)

3. ✅ **Cores** (Pr>Fc = 0): **HIGHLY SIGNIFICANT**
   - The number of cores (0.5, 1, 2) significantly affects performance
   - Fc = 1857.914 (very strong effect)

4. ❌ **Language × RAM** (Pr>Fc = 0.7026): **NOT SIGNIFICANT**
   - There is no interaction between language and RAM

5. ✅ **Language × Cores** (Pr>Fc = 0): **SIGNIFICANT**
   - ⚠️ **IMPORTANT**: The effect of cores depends on the chosen language!
   - This means each language responds differently to increasing cores

6. ❌ **RAM × Cores** (Pr>Fc = 0.7388): **NOT SIGNIFICANT**
   - There is no interaction between RAM and number of cores

7. ❌ **Language × RAM × Cores** (Pr>Fc = 0.9143): **NOT SIGNIFICANT**
   - Triple interaction is not significant

### 📊 **Coefficient of Variation (CV)**
- **CV = 9.36%**
- Indicator of relative data variability
- CV < 15% indicates **good experimental precision** ✅

### ⚠️ **Residual Normality Test**
```
p-value: 5.845355e-19
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
a 	 PHP 	 4.996667    ← PIOR (5 segundos)
 b 	 Ruby 	 2.655556 
  c 	 Python 	 1.217778 
   d 	 Java 	 0.6925244 
    e 	 JavaScript 	 0.4816867 
     f 	 C# 	 0.2771022 
      g 	 Go 	 0.1440567 
       h 	 Rust 	 0.02151778    ← MELHOR (0.02 segundos)
```
**Interpretação**: Letras diferentes indicam desempenhos significativamente diferentes. Rust é ~232 vezes mais rápido que PHP!

#### **Com 1 Núcleo**
```
a 	 PHP 	 4.992222    ← PIOR
 b 	 Ruby 	 0.9838911 
  c 	 Python 	 0.4670822 
   d 	 Java 	 0.2696611 
   de 	 C# 	 0.1850256 
    ef 	 JavaScript 	 0.1050456 
    ef 	 Go 	 0.09730333 
     f 	 Rust 	 0.02084556    ← MELHOR
```
**Interpretação**: Com 1 núcleo, Rust permanece sendo o mais rápido. PHP permanece sendo o mais lento.

#### **Com 2 Núcleos**
```
a 	 PHP 	 2.372222    ← PIOR
 b 	 Ruby 	 0.4812 
 b 	 Python 	 0.4529689 
  c 	 C# 	 0.1155067 
  c 	 Go 	 0.1033022 
  c 	 JavaScript 	 0.09353111 
  c 	 Java 	 0.08598111 
  c 	 Rust 	 0.02184333    ← MELHOR
```
**Interpretação**: Com 2 núcleos, a maioria das linguagens (C#, Go, JavaScript, Java, Rust) tem desempenho estatisticamente similar (~0.09-0.12s). Rust permanece o mais rápido.

### 🎯 **Principais Descobertas**:
1. **Rust é consistentemente a linguagem mais rápida** em todas as configurações
2. **PHP é consistentemente a linguagem mais lenta** em todas as configurações
3. **Com 2 núcleos**, várias linguagens têm desempenho estatisticamente equivalente
4. **Ruby e Python melhoram com mais núcleos** (redução de 2.6s para 0.5s)

### 🇬🇧 English

Since the Language × Cores interaction is significant, we need to analyze the behavior of each language in relation to cores.

### 📊 2.1 Language Comparison within each Core Level

#### **With 0.5 Core** (General Performance)
```
a 	 PHP 	 4.996667    ← WORST (5 seconds)
 b 	 Ruby 	 2.655556 
  c 	 Python 	 1.217778 
   d 	 Java 	 0.6925244 
    e 	 JavaScript 	 0.4816867 
     f 	 C# 	 0.2771022 
      g 	 Go 	 0.1440567 
       h 	 Rust 	 0.02151778    ← BEST (0.02 seconds)
```
**Interpretation**: Different letters indicate significantly different performances. Rust is ~232 times faster than PHP!

#### **With 1 Core**
```
a 	 PHP 	 4.992222    ← WORST
 b 	 Ruby 	 0.9838911 
  c 	 Python 	 0.4670822 
   d 	 Java 	 0.2696611 
   de 	 C# 	 0.1850256 
    ef 	 JavaScript 	 0.1050456 
    ef 	 Go 	 0.09730333 
     f 	 Rust 	 0.02084556    ← BEST
```
**Interpretation**: With 1 core, Rust remains the fastest. PHP remains the slowest.

#### **With 2 Cores**
```
a 	 PHP 	 2.372222    ← WORST
 b 	 Ruby 	 0.4812 
 b 	 Python 	 0.4529689 
  c 	 C# 	 0.1155067 
  c 	 Go 	 0.1033022 
  c 	 JavaScript 	 0.09353111 
  c 	 Java 	 0.08598111 
  c 	 Rust 	 0.02184333    ← BEST
```
**Interpretation**: With 2 cores, most languages (C#, Go, JavaScript, Java, Rust) have statistically similar performance (~0.09-0.12s). Rust remains the fastest.

### 🎯 **Main Findings**:
1. **Rust is consistently the fastest language** in all configurations
2. **PHP is consistently the slowest language** in all configurations
3. **With 2 cores**, several languages have statistically equivalent performance
4. **Ruby and Python improve with more cores** (reduction from 2.6s to 0.5s)

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

---

## 🎯 Parte 4: Análise do Efeito da RAM / Part 4: RAM Effect Analysis

### 🇧🇷 Português

```
RAM
De acordo com o teste F, as medias desse fator sao estatisticamente iguais.
 Niveis    Medias
1   1000 0.8858633
2    250 0.9015436
3    500 0.8794081
```

### 🔍 **Interpretação**:
- **A quantidade de RAM NÃO afeta significativamente** o tempo de resposta
- As diferenças entre as médias (0.87s - 0.90s) são estatisticamente insignificantes
- **Conclusão**: Para esta aplicação, o uso de RAM não é um gargalo

### 🇬🇧 English

```
RAM
According to the F test, the means of this factor are statistically equal.
 Levels    Means
1   1000 0.8858633
2    250 0.9015436
3    500 0.8794081
```

### 🔍 **Interpretation**:
- **The amount of RAM does NOT significantly affect** response time
- The differences between means (0.87s - 0.90s) are statistically insignificant
- **Conclusion**: For this application, RAM usage is not a bottleneck

---

## 📊 Resumo Executivo - Principais Conclusões / Executive Summary - Main Conclusions

### 🏆 **Ranking de Performance (Resumo) / Performance Ranking (Summary)**:

#### **Top 3 Mais Rápidas / Top 3 Fastest**:
1. 🦀 **Rust** - ~0.021s (34-40x mais rápido que a média / 34-40x faster than average)
2. 🦫 **Go** - ~0.10s
3. 🔵 **C#** - ~0.12s

#### **Bottom 3 Mais Lentas / Bottom 3 Slowest**:
1. 🐘 **PHP** - ~4-5s com 0.5-1 núcleo, ~2.4s com 2 núcleos / ~4-5s with 0.5-1 core, ~2.4s with 2 cores
2. 💎 **Ruby** - ~2.6s com 0.5 núcleo, melhora para ~0.5s com 2 núcleos / ~2.6s with 0.5 core, improves to ~0.5s with 2 cores
3. 🐍 **Python** - ~1.2s com 0.5 núcleo, melhora para ~0.45s com 2 núcleos / ~1.2s with 0.5 core, improves to ~0.45s with 2 cores

### 💡 **Insights Importantes / Important Insights**:

1. **Núcleos são importantes / Cores are important** para / for: PHP, Ruby, Python, Java, JavaScript
   - Linguagens interpretadas se beneficiam MUITO de mais núcleos / Interpreted languages benefit GREATLY from more cores

2. **Núcleos são irrelevantes / Cores are irrelevant** para / for: Rust, Go
   - Compiladas com alta otimização não se beneficiam tanto / Highly optimized compiled languages don't benefit as much

3. **RAM é irrelevante / RAM is irrelevant** para todas as linguagens / for all languages
   - As diferenças de 250MB, 500MB, 1000MB não causam impacto significativo / Differences of 250MB, 500MB, 1000MB do not cause significant impact

4. **Linguagem × Núcleo interagem / Language × Cores interact**:
   - Cada linguagem responde de forma diferente ao número de núcleos / Each language responds differently to the number of cores
   - Linguagens mais lentas se beneficiam mais dos núcleos extras / Slower languages benefit more from extra cores

5. **Rust é superior / Rust is superior** em todos os cenários / in all scenarios
   - Performance consistente independente de configuração / Consistent performance regardless of configuration
   - Código compilado nativamente otimizado / Native optimized compiled code

### 📈 **Recomendações Práticas / Practical Recommendations**:

- **Para máxima performance / For maximum performance**: Use **Rust** (rápido em qualquer configuração / fast in any configuration)
- **Para desenvolvimento rápido com bom desempenho / For rapid development with good performance**: Use **Go** or **C#**
- **Para linguagens interpretadas / For interpreted languages**: Use pelo menos / use at least **2 núcleos / cores** para obter melhor desempenho / to obtain better performance
- **RAM não é crítico / RAM is not critical**: Usar / Using 250MB, 500MB ou / or 1000MB não faz diferença significativa / does not make significant difference
- **Evite PHP / Avoid PHP** para tarefas de CPU intensivas / for CPU-intensive tasks: É / It is 100-200x mais lento que Rust / slower than Rust

---

## 📚 Glossário / Glossary

### 🇧🇷 Português

- **CV (Coeficiente de Variação)**: Medida de variabilidade relativa (CV < 15% = bom)
- **Fc**: Estatística F calculada (quanto maior, mais forte o efeito)
- **Pr>Fc (valor-p)**: Probabilidade de obter o resultado por acaso
- **R²**: Coeficiente de determinação (proporção da variabilidade explicada)
- **GL (Graus de Liberdade)**: Quantidade de informações independentes
- **Significativo**: Diferença real comprovada estatisticamente (não é por acaso)
- **DIC**: Delineamento Inteiramente Casualizado (tratamentos distribuídos aleatoriamente)

### 🇬🇧 English

- **CV (Coefficient of Variation)**: Measure of relative variability (CV < 15% = good)
- **Fc**: Calculated F statistic (the higher, the stronger the effect)
- **Pr>Fc (p-value)**: Probability of obtaining the result by chance
- **R²**: Coefficient of determination (proportion of explained variability)
- **GL (Degrees of Freedom)**: Amount of independent information
- **Significant**: Real difference statistically proven (not by chance)
- **CRD**: Completely Randomized Design (treatments randomly distributed)
