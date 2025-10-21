# Dockerfile para API JavaScript (NestJS)
FROM node:18-alpine AS builder

WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar todas as dependências (incluindo devDependencies para o build)
RUN npm ci

# Copiar código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Imagem final
FROM node:18-alpine

WORKDIR /app

# Instalar apenas dependências de produção na imagem final
COPY --from=builder /app/package*.json ./
RUN npm ci --only=production && npm cache clean --force

# Copiar código compilado
COPY --from=builder /app/dist ./dist

# Expor porta
EXPOSE 3000

# Comando para executar
CMD ["npm", "run", "start:prod"]
