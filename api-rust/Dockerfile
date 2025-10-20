# Dockerfile para API Rust (Actix-web)
FROM rust:1.75-alpine AS builder

WORKDIR /app

# Instalar dependências do sistema
RUN apk add --no-cache musl-dev

# Copiar arquivos de dependências
COPY Cargo.toml Cargo.lock ./

# Criar um arquivo main.rs temporário para cache de dependências
RUN mkdir src && echo "fn main() {}" > src/main.rs

# Baixar e compilar dependências
RUN cargo build --release

# Remover o arquivo temporário
RUN rm src/main.rs

# Copiar código fonte
COPY src ./src

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
