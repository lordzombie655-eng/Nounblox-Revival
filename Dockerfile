# Usamos una imagen oficial de PHP con Apache incorporado
FROM php:8.1-apache

# Instalamos la extensión necesaria para conectar PHP con MySQL (PDO y mysqli)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiamos todos los archivos del Revival al directorio web del servidor
COPY . /var/www/html/

# Exponemos el puerto estándar que usa Render
EXPOSE 80
 
