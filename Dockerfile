FROM php:8.6-apache@sha256:0b06b358a7d59cca80e0528aad0e49b43208c3a74754ffcd8a12d7727058511e

RUN a2enmod rewrite
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
