# Docker Compose - BestLanguage Project

## 📋 Resumo

Este arquivo `docker-compose.yml` contém **72 serviços** (8 linguagens × 3 configurações de CPU × 3 configurações de RAM) para realizar testes de performance com diferentes especificações de hardware.

## 🔧 Configurações Disponíveis

### Linguagens de Programação
- **C# (.NET)** - Portas 3001-3009
- **Go (Fiber)** - Portas 3010-3018  
- **Python (Flask)** - Portas 3019-3027
- **JavaScript (NestJS)** - Portas 3028-3036
- **PHP (Laravel)** - Portas 3037-3045
- **Ruby (Rails)** - Portas 3046-3054
- **Rust (Actix-web)** - Portas 3055-3063
- **Java (Spring Boot)** - Portas 3064-3072

### Especificações de Hardware

#### CPU (Núcleos)
- **0.5 núcleo** - Limitação de CPU para 50% de um núcleo
- **1 núcleo** - Limitação de CPU para 1 núcleo completo
- **2 núcleos** - Limitação de CPU para 2 núcleos

#### RAM (Memória)
- **250MB** - Limitação de memória para 250 megabytes
- **500MB** - Limitação de memória para 500 megabytes  
- **1GB** - Limitação de memória para 1 gigabyte

## 🚀 Como Executar

### Executar Todos os Serviços
```bash
docker-compose up -d
```

### Executar Serviços Específicos
```bash
# Executar apenas APIs C# com 0.5 núcleo
docker-compose up -d api-csharp-05-250 api-csharp-05-500 api-csharp-05-1g

# Executar apenas APIs Go com 1 núcleo
docker-compose up -d api-fiber-1-250 api-fiber-1-500 api-fiber-1-1g

# Executar apenas APIs Python com 2 núcleos
docker-compose up -d api-flask-2-250 api-flask-2-500 api-flask-2-1g
```

### Parar Serviços
```bash
# Parar todos os serviços
docker-compose down

# Parar serviços específicos
docker-compose stop api-csharp-05-250
```

## 🧪 Testando as APIs

Todas as APIs respondem no endpoint `POST /` com o seguinte formato:

### Requisição
```bash
curl -X POST http://localhost:[PORTA]/ \
  -H "Content-Type: application/json" \
  -d '{"number": 17}'
```

### Resposta
```json
{"is_prime": true}
```

### Exemplos de Teste
```bash
# Testar API C# com 0.5 núcleo e 250MB RAM
curl -X POST http://localhost:3001/ \
  -H "Content-Type: application/json" \
  -d '{"number": 17}'

# Testar API Go com 1 núcleo e 500MB RAM  
curl -X POST http://localhost:3014/ \
  -H "Content-Type: application/json" \
  -d '{"number": 17}'

# Testar API Rust com 2 núcleos e 1GB RAM
curl -X POST http://localhost:3063/ \
  -H "Content-Type: application/json" \
  -d '{"number": 17}'
```

## 📊 Mapeamento de Portas

| Linguagem | CPU | RAM | Porta |
|-----------|-----|-----|-------|
| C# | 0.5 | 250MB | 3001 |
| C# | 0.5 | 500MB | 3002 |
| C# | 0.5 | 1GB | 3003 |
| C# | 1 | 250MB | 3004 |
| C# | 1 | 500MB | 3005 |
| C# | 1 | 1GB | 3006 |
| C# | 2 | 250MB | 3007 |
| C# | 2 | 500MB | 3008 |
| C# | 2 | 1GB | 3009 |
| Go | 0.5 | 250MB | 3010 |
| Go | 0.5 | 500MB | 3011 |
| Go | 0.5 | 1GB | 3012 |
| Go | 1 | 250MB | 3013 |
| Go | 1 | 500MB | 3014 |
| Go | 1 | 1GB | 3015 |
| Go | 2 | 250MB | 3016 |
| Go | 2 | 500MB | 3017 |
| Go | 2 | 1GB | 3018 |
| Python | 0.5 | 250MB | 3019 |
| Python | 0.5 | 500MB | 3020 |
| Python | 0.5 | 1GB | 3021 |
| Python | 1 | 250MB | 3022 |
| Python | 1 | 500MB | 3023 |
| Python | 1 | 1GB | 3024 |
| Python | 2 | 250MB | 3025 |
| Python | 2 | 500MB | 3026 |
| Python | 2 | 1GB | 3027 |
| JavaScript | 0.5 | 250MB | 3028 |
| JavaScript | 0.5 | 500MB | 3029 |
| JavaScript | 0.5 | 1GB | 3030 |
| JavaScript | 1 | 250MB | 3031 |
| JavaScript | 1 | 500MB | 3032 |
| JavaScript | 1 | 1GB | 3033 |
| JavaScript | 2 | 250MB | 3034 |
| JavaScript | 2 | 500MB | 3035 |
| JavaScript | 2 | 1GB | 3036 |
| PHP | 0.5 | 250MB | 3037 |
| PHP | 0.5 | 500MB | 3038 |
| PHP | 0.5 | 1GB | 3039 |
| PHP | 1 | 250MB | 3040 |
| PHP | 1 | 500MB | 3041 |
| PHP | 1 | 1GB | 3042 |
| PHP | 2 | 250MB | 3043 |
| PHP | 2 | 500MB | 3044 |
| PHP | 2 | 1GB | 3045 |
| Ruby | 0.5 | 250MB | 3046 |
| Ruby | 0.5 | 500MB | 3047 |
| Ruby | 0.5 | 1GB | 3048 |
| Ruby | 1 | 250MB | 3049 |
| Ruby | 1 | 500MB | 3050 |
| Ruby | 1 | 1GB | 3051 |
| Ruby | 2 | 250MB | 3052 |
| Ruby | 2 | 500MB | 3053 |
| Ruby | 2 | 1GB | 3054 |
| Rust | 0.5 | 250MB | 3055 |
| Rust | 0.5 | 500MB | 3056 |
| Rust | 0.5 | 1GB | 3057 |
| Rust | 1 | 250MB | 3058 |
| Rust | 1 | 500MB | 3059 |
| Rust | 1 | 1GB | 3060 |
| Rust | 2 | 250MB | 3061 |
| Rust | 2 | 500MB | 3062 |
| Rust | 2 | 1GB | 3063 |
| Java | 0.5 | 250MB | 3064 |
| Java | 0.5 | 500MB | 3065 |
| Java | 0.5 | 1GB | 3066 |
| Java | 1 | 250MB | 3067 |
| Java | 1 | 500MB | 3068 |
| Java | 1 | 1GB | 3069 |
| Java | 2 | 250MB | 3070 |
| Java | 2 | 500MB | 3071 |
| Java | 2 | 1GB | 3072 |

## ⚠️ Considerações Importantes

1. **Recursos do Sistema**: Executar todos os 72 serviços simultaneamente requer recursos significativos de CPU e RAM.

2. **Limitações de Docker**: As limitações de recursos são aplicadas através do Docker Swarm mode ou Docker Compose v3.8+.

3. **Testes Graduais**: Recomenda-se executar grupos menores de serviços para testes mais controlados.

4. **Monitoramento**: Use `docker stats` para monitorar o uso de recursos dos containers.

## 🔍 Comandos Úteis

```bash
# Ver logs de um serviço específico
docker-compose logs api-csharp-05-250

# Ver status de todos os serviços
docker-compose ps

# Rebuild de um serviço específico
docker-compose build api-csharp-05-250

# Executar apenas um serviço para teste
docker-compose up api-csharp-05-250
```
