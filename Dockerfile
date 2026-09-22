# Usamos la imagen oficial de PHP con Apache
FROM php:8.1-apache

# 1. Habilitamos el módulo mod_rewrite de Apache para procesar el .htaccess
RUN a2enmod rewrite

# 2. Permitimos que Apache anule la configuración y lea las reglas del archivo .htaccess
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# 3. Instalamos las extensiones necesarias para conectar PHP con MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 4. Copiamos los archivos del Revival al directorio del servidor
COPY . /var/www/html/

# Exponemos el puerto estándar
EXPOSE 80
