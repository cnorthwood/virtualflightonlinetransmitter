FROM php:8.5-apache@sha256:37f2df0c08843e43ee63d0c3ca1c1c406a252720fb74d8f5392a095e6b449134

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
