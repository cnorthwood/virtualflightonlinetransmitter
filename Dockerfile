FROM php:8.5-apache@sha256:fcf1877806085ea8ceec1072f93c1fed4df701f5da21ff5c976c3c362e4b7859

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
