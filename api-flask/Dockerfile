# Dockerfile para API Python (Flask)
FROM python:3.11-slim

WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copiar arquivos de dependências
COPY pyproject.toml ./

# Instalar uv se não estiver disponível
RUN pip install uv

# Instalar dependências Python
RUN uv sync

# Copiar código fonte
COPY . .

# Expor porta
EXPOSE 3000

# Configurar variáveis de ambiente
ENV HOST=0.0.0.0
ENV PORT=3000
ENV FLASK_DEBUG=False

# Comando para executar
CMD ["uv", "run", "python", "main.py"]
