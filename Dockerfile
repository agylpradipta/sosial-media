FROM php:7.2-apache
COPY app/ /var/www/html/

RUN docker-php-ext-install pdo pdo_mysql 


#Testing branch