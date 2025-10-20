# Dockerfile para API PHP (Laravel)
FROM php:8.2-fpm-alpine

# Instalar dependências do sistema
RUN apk add --no-cache \
    nginx \
    sqlite \
    curl \
    zip \
    unzip \
    git \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    libxml2-dev

# Instalar extensões PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_sqlite mbstring xml

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar arquivos de dependências
COPY composer.json composer.lock ./

# Instalar dependências PHP
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Copiar código fonte
COPY . .

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

# Configurar Nginx
COPY <<EOF /etc/nginx/http.d/default.conf
server {
    listen 80;
    server_name localhost;
    root /var/www/html/public;
    index index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

# Script de inicialização
COPY <<EOF /start.sh
#!/bin/sh
php-fpm -D
nginx -g 'daemon off;'
EOF

RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
