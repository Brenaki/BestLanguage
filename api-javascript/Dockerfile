# Dockerfile para API JavaScript (NestJS)
FROM node:18-alpine AS builder

WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production

# Copiar código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Imagem final
FROM node:18-alpine

WORKDIR /app

# Copiar node_modules e código compilado
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

# Expor porta
EXPOSE 3000

# Comando para executar
CMD ["npm", "run", "start:prod"]
