# BestLanguage - Análise de Variância de Performance de APIs

## 📋 Sobre o Projeto

Este projeto foi desenvolvido como parte de um trabalho acadêmico focado em **Análise de Variância (ANOVA)** para avaliar o desempenho de diferentes linguagens de programação na implementação de APIs. O objetivo é estruturar um experimento científico e interpretar os resultados obtidos através de análise estatística.

## 🎯 Objetivo do Trabalho

O trabalho visa avaliar se o aluno consegue:
- Estruturar um experimento científico adequadamente
- Interpretar resultados estatísticos
- Aplicar análise de variância no R
- Compreender a interação entre fatores experimentais

## 🔬 Estrutura do Experimento

### Fatores Experimentais

**Fator 1 (Numérico):** Tamanho de Memória RAM
- 250MB
- 500MB  
- 1GB

**Fator 2 (Não-Numérico):** Linguagens de Programação
- C# (.NET)
- Golang (Fiber)
- Python (Flask)
- JavaScript (Node.js/NestJS)
- PHP (Laravel)
- Ruby (Rails)
- Rust (Actix-web)
- Java (Spring Boot)

**Bloco:** Núcleos de CPU
- 0.5 núcleo
- 1 núcleo
- 2 núcleos

**Variável Resposta:** Tempo de resposta (milissegundos/segundos)

## 🏗️ Arquitetura do Projeto

O projeto consiste em 8 APIs idênticas implementadas em diferentes linguagens de programação, todas realizando a mesma operação: **verificação de números primos**.

### Estrutura das APIs

Cada API possui:
- **Endpoint:** `POST /`
- **Entrada:** `{"number": <número_inteiro>}`
- **Saída:** `{"is_prime": <boolean>}`
- **Funcionalidade:** Algoritmo de verificação de números primos

### Tecnologias Utilizadas

| Linguagem | Framework | Diretório |
|-----------|-----------|-----------|
| C# | ASP.NET Core | `api-csharp/` |
| Go | Fiber | `api-fiber/` |
| Python | Flask | `api-flask/` |
| JavaScript | NestJS | `api-javascript/` |
| PHP | Laravel | `api-laravel/` |
| Ruby | Rails | `api-rails/` |
| Rust | Actix-web | `api-rust/` |
| Java | Spring Boot | `api-spring-boot/` |

## 🚀 Como Executar

### Pré-requisitos
- Docker e Docker Compose
- Node.js (para APIs JavaScript)
- Python 3.x (para API Flask)
- PHP 8.x (para API Laravel)
- Ruby 3.x (para API Rails)
- .NET 6+ (para API C#)
- Go 1.19+ (para API Golang)
- Rust 1.70+ (para API Rust)
- Java 17+ (para API Spring Boot)

### Executando as APIs

Cada API pode ser executada individualmente:

```bash
# C# (.NET)
cd api-csharp
dotnet run

# Golang (Fiber)
cd api-fiber
go run main.go

# Python (Flask)
cd api-flask
python main.py

# JavaScript (NestJS)
cd api-javascript
npm install
npm run start:dev

# PHP (Laravel)
cd api-laravel
composer install
php artisan serve

# Ruby (Rails)
cd api-rails
bundle install
rails server

# Rust (Actix-web)
cd api-rust
cargo run

# Java (Spring Boot)
cd api-spring-boot
./mvnw spring-boot:run
```

### Testando as APIs

Todas as APIs respondem na porta 3000 (padrão) e podem ser testadas com:

```bash
curl -X POST http://localhost:3000/ \
  -H "Content-Type: application/json" \
  -d '{"number": 17}'
```

Resposta esperada:
```json
{"is_prime": true}
```

## 📊 Metodologia de Teste Simplificada / Simplified Test Methodology

### 🇧🇷 Português

#### Por que uma metodologia simplificada?

Este experimento foi projetado para **testar apenas os tempos de resposta de APIs de forma simples e controlada**. Para testar em um ambiente de produção real, ocorreriam interferências não desejadas que dificultariam a análise estatística:

- **Banco de Dados**: Conexões, consultas SQL e I/O adicionariam variação externa
- **Cache**: Sistemas de cache mascarariam o desempenho puro das linguagens
- **Conexões de Rede**: Latência de rede e conexões externas introduziriam ruído
- **I/O de Disco**: Operações de leitura/escrita em arquivos adicionariam variabilidade
- **Processos em Background**: Tarefas concorrentes afetariam os resultados

#### Abordagem Adotada

A solução foi **isolar o processamento puro** das linguagens através de um algoritmo simples: verificação de números primos. Isto permite:

✅ Medir o desempenho fundamental de cada linguagem
✅ Eliminar fontes externas de variação
✅ Obter resultados reprodutíveis e confiáveis
✅ Focar na eficiência de execução da linguagem
✅ Comparar diretamente o tempo de processamento

Esta metodologia foi a forma mais simples e científica de estudar as diferenças de performance entre linguagens de programação.

#### Coleta de Dados

1. **Configuração do Ambiente:**
   - Configurar diferentes tamanhos de RAM (250MB, 500MB, 1GB)
   - Configurar diferentes números de núcleos de CPU (0.5, 1, 2)
   - Executar cada API em cada configuração
   - Realizar 3 repetições por tratamento

2. **Execução dos Testes:**
   - Enviar 100.000 requisições para verificação de números primos
   - Medir tempo médio de resposta para cada requisição
   - Repetir testes 3 vezes para garantir confiabilidade

3. **Análise Estatística:**
   - Aplicar ANOVA no R usando o script `BestLanguage.R`
   - Verificar significância dos fatores
   - Analisar interações entre fatores
   - Gerar 8 gráficos de regressão por linguagem

#### Arquivos de Análise

- 📄 **`results_summary.csv`**: Contém todos os dados experimentais (216 observações)
- 📊 **`BestLanguage.R`**: Script R que executa a ANOVA e gera os gráficos de regressão
- 📖 **`README_ANALISE.md`**: Guia completo de interpretação dos resultados estatísticos
- 📈 **Gráficos gerados**: 8 gráficos mostrando o efeito dos núcleos em cada linguagem

---

### 🇬🇧 English

#### Why a Simplified Methodology?

This experiment was designed to **test only API response times in a simple and controlled way**. Testing in a real production environment would introduce undesired interferences that would complicate statistical analysis:

- **Database**: Connections, SQL queries, and I/O would add external variation
- **Cache**: Caching systems would mask the pure performance of languages
- **Network Connections**: Network latency and external connections would introduce noise
- **Disk I/O**: File read/write operations would add variability
- **Background Processes**: Concurrent tasks would affect results

#### Approach Adopted

The solution was to **isolate the pure processing** of languages through a simple algorithm: prime number verification. This allows:

✅ Measure the fundamental performance of each language
✅ Eliminate external sources of variation
✅ Obtain reproducible and reliable results
✅ Focus on language execution efficiency
✅ Directly compare processing time

This methodology was the simplest and most scientific way to study performance differences between programming languages.

#### Data Collection

1. **Environment Setup:**
   - Configure different RAM sizes (250MB, 500MB, 1GB)
   - Configure different CPU core counts (0.5, 1, 2)
   - Run each API in each configuration
   - Perform 3 repetitions per treatment

2. **Test Execution:**
   - Send 100,000 requests for prime number verification
   - Measure average response time for each request
   - Repeat tests 3 times to ensure reliability

3. **Statistical Analysis:**
   - Apply ANOVA in R using the `BestLanguage.R` script
   - Check significance of factors
   - Analyze interactions between factors
   - Generate 8 regression graphs per language

#### Analysis Files

- 📄 **`results_summary.csv`**: Contains all experimental data (216 observations)
- 📊 **`BestLanguage.R`**: R script that executes ANOVA and generates regression graphs
- 📖 **`README_ANALISE.md`**: Complete guide to interpreting statistical results
- 📈 **Generated Graphs**: 8 graphs showing the effect of cores on each language

---

## 📊 Dados e Análise / Data and Analysis

## 📈 Análise de Variância

### Hipóteses Testadas

1. **H0:** Não há diferença significativa entre os tamanhos de RAM
2. **H0:** Não há diferença significativa entre as linguagens de programação  
3. **H0:** Não há diferença significativa entre os números de núcleos de CPU
4. **H0:** Não há interação significativa entre os fatores

### Interpretação dos Resultados

- **Valor p < 0.05:** Rejeita H0 (diferença significativa)
- **Valor p ≥ 0.05:** Não rejeita H0 (sem diferença significativa)
- **Interação significativa:** O efeito de um fator depende do nível do outro fator

## 🎓 Aspectos Acadêmicos

### Requisitos do Trabalho

- ✅ Estruturação adequada dos dados experimentais
- ✅ Aplicação de análise de variância no R
- ✅ Interpretação completa dos testes estatísticos
- ✅ Demonstração ao vivo dos comandos R
- ✅ Apresentação de gráficos de análise
- ✅ Manipulação de dados para forçar interação significativa (quando necessário)
- ✅ Comparação entre resultados reais e "forçados"

### Conceitos Fundamentais

- **Fator:** Variável independente que pode influenciar a variável resposta
- **Bloco:** Fonte de variação que pode interferir nos resultados
- **Variável Resposta:** Métrica medida para avaliar o efeito dos fatores
- **Interação:** Quando o efeito de um fator depende do nível de outro fator

## 📁 Estrutura do Repositório

```
BestLanguage/
├── api-csharp/               # API em C# (.NET)
├── api-fiber/                # API em Go (Fiber)
├── api-flask/                # API em Python (Flask)
├── api-javascript/           # API em JavaScript (NestJS)
├── api-laravel/              # API em PHP (Laravel)
├── api-rails/                # API em Ruby (Rails)
├── api-rust/                 # API em Rust (Actix-web)
├── api-spring-boot/          # API em Java (Spring Boot)
├── results_summary.csv       # 📊 Dados experimentais (216 observações)
├── BestLanguage.R            # 📈 Script R com ANOVA e gráficos
├── README.md                 # 📖 Este arquivo
└── README_ANALISE.md         # 📚 Guia de interpretação dos resultados
```

### 📊 Arquivos de Análise

#### `results_summary.csv`
Contém todos os dados coletados do experimento:
- **Colunas**: Linguagem, Memoria_RAM, Nucleo, Media_tempo_de_resposta
- **Observações**: 216 registros (8 linguagens × 3 RAM × 3 núcleos × 3 repetições)
- **Formato**: CSV com separador de vírgula

#### `BestLanguage.R`
Script R completo que realiza:
1. Carrega os dados de `results_summary.csv`
2. Executa análise de variância (ANOVA) fatorial 3 fatores
3. Gera 8 gráficos de regressão mostrando o efeito dos núcleos em cada linguagem
4. Plota modelos lineares e quadráticos para cada linguagem

**Para executar:**
```r
source("BestLanguage.R")
```

#### `README_ANALISE.md`
Guia completo de interpretação incluindo:
- Explicação detalhada de cada teste estatístico
- Interpretação da tabela de ANOVA
- Análise das interações significativas
- Desdobramento da interação Linguagem × Núcleo
- Análise de regressão para cada linguagem
- Principais conclusões e recomendações práticas

#### Gráficos Gerados

Ao executar `BestLanguage.R`, são gerados **8 gráficos** (1 para cada linguagem):
- **C#**: Modelo linear (R² = 0.9286)
- **Java**: Modelo quadrático (R² = 1.0)
- **JavaScript**: Modelo quadrático (R² = 1.0)
- **PHP**: Modelo quadrático (R² = 1.0)
- **Python**: Modelo quadrático (R² = 1.0)
- **Ruby**: Modelo quadrático (R² = 1.0)
- **Go**: Sem diferença significativa
- **Rust**: Sem diferença significativa

Cada gráfico mostra:
- Pontos observados (médias por número de núcleos)
- Curva de regressão linear (preto)
- Curva de regressão quadrática (vermelho)
- Equações dos modelos e coeficientes R²

## 📊 Resultados Principais / Main Results

### 🇧🇷 Português

#### Resumo Estatístico
- **Linguagens testadas**: 8 (C#, Go, Java, JavaScript, PHP, Python, Ruby, Rust)
- **Total de observações**: 216
- **Repetições**: 3 por tratamento
- **CV (Coeficiente de Variação)**: 9.36% (boa precisão)

#### Principais Descobertas

1. **Rust é a linguagem mais rápida** (~0.021s), 34-40x mais rápido que a média
2. **PHP é a mais lenta** (~4-5s com 0.5/1 núcleo), 100-200x mais lento que Rust
3. **RAM não afeta significativamente** o desempenho (Pr>F = 0.2629)
4. **Núcleos são importantes** para linguagens interpretadas (PHP, Python, Ruby)
5. **Núcleos são irrelevantes** para linguagens compiladas (Rust, Go)

#### Ranking de Performance

🏆 **Top 3**: 
1. Rust (~0.021s)
2. Go (~0.10s)  
3. C# (~0.12s)

⚡ **Bottom 3**:
1. PHP (~4-5s)
2. Ruby (~2.6s → 0.5s com núcleos)
3. Python (~1.2s → 0.45s com núcleos)

Para interpretação detalhada, consulte o arquivo **[`README_ANALISE.md`](README_ANALISE.md)**.

### 🇬🇧 English

#### Statistical Summary
- **Languages tested**: 8 (C#, Go, Java, JavaScript, PHP, Python, Ruby, Rust)
- **Total observations**: 216
- **Repetitions**: 3 per treatment
- **CV (Coefficient of Variation)**: 9.36% (good precision)

#### Main Findings

1. **Rust is the fastest language** (~0.021s), 34-40x faster than the mean
2. **PHP is the slowest** (~4-5s with 0.5/1 core), 100-200x slower than Rust
3. **RAM does not significantly affect** performance (Pr>F = 0.2629)
4. **Cores matter** for interpreted languages (PHP, Python, Ruby)
5. **Cores are irrelevant** for compiled languages (Rust, Go)

#### Performance Ranking

🏆 **Top 3**:
1. Rust (~0.021s)
2. Go (~0.10s)
3. C# (~0.12s)

⚡ **Bottom 3**:
1. PHP (~4-5s)
2. Ruby (~2.6s → 0.5s with cores)
3. Python (~1.2s → 0.45s with cores)

For detailed interpretation, see the file **[`README_ANALISE.md`](README_ANALISE.md)**.

---

## 📚 Referências e Documentação / References and Documentation

### 📖 Documentação Completa
- **[`README_ANALISE.md`](README_ANALISE.md)**: Guia completo de interpretação dos resultados estatísticos
- **[`BestLanguage.R`](BestLanguage.R)**: Script R com análise de variância completa
- **[`results_summary.csv`](results_summary.csv)**: Dataset completo com 216 observações

### 🔬 Metodologia
- **Delineamento**: Fatorial 3 fatores em DIC (Delineamento Inteiramente Casualizado)
- **Análise**: ANOVA com testes F e Tukey para comparação de médias
- **Regressão**: Modelos polinomiais lineares e quadráticos
- **Significância**: α = 0.05

### 📈 Como Reproduzir

1. Execute o script R:
```r
source("BestLanguage.R")
```

2. Analise os resultados:
   - Tabela de ANOVA será exibida no console
   - 8 gráficos serão gerados mostrando regressão por linguagem
   - Consultar `README_ANALISE.md` para interpretação

3. Explore os dados:
```r
read.csv("results_summary.csv")
```

## 🤝 Contribuição / Contribution

Este é um projeto acadêmico desenvolvido para fins de estudo e análise estatística. Contribuições são bem-vindas para melhorar a implementação das APIs ou a metodologia de teste.

This is an academic project developed for study and statistical analysis purposes. Contributions are welcome to improve API implementation or testing methodology.

## 📝 Licença / License

Este projeto é destinado exclusivamente para fins acadêmicos e educacionais.

This project is intended exclusively for academic and educational purposes.

---

**Nota / Note:** Este projeto foi desenvolvido como parte de um trabalho acadêmico focado em análise de variância e comparação de performance entre diferentes linguagens de programação.

This project was developed as part of an academic work focused on variance analysis and performance comparison between different programming languages.
