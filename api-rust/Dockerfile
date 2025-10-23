# Dockerfile para API Rust (Actix-web)
FROM rust:1.85-alpine AS builder

WORKDIR /app

# Instalar dependências do sistema
RUN apk add --no-cache musl-dev

# Copiar todos os arquivos
COPY . .

# Compilar a aplicação
RUN cargo build --release

# Imagem final
FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copiar o binário compilado
COPY --from=builder /app/target/release/api-rust .

# Expor porta
EXPOSE 3000

# Comando para executar
CMD ["./api-rust"]
