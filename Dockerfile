FROM php:8.5-apache@sha256:256c25149bca6639f538ece3c5dda90684409227dec546b87ca174950569b8f1

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
