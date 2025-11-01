# Dockerfile para API PHP (Laravel)
FROM php:8.4-fpm-alpine


# Instalar dependências do sistema
RUN apk add --no-cache nginx

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar arquivos de dependências
COPY composer.json composer.lock ./

# Instalar dependências PHP (sem scripts para evitar problemas com artisan)
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts

# Copiar código fonte
COPY . .

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html

# Configurar Nginx
COPY <<EOF /etc/nginx/http.d/default.conf
server {
    listen 80;
    server_name localhost;
    root /var/www/html/;
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
