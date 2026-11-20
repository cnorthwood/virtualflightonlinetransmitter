FROM php:8.5-apache@sha256:0a785eab8b7eb4836f9c6093771c8ea15ff8ba7269444f3da70a1d33d15fe664

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
