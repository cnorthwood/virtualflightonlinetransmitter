FROM php:8.5-apache@sha256:4cc63b3d4e05c40da73e7af5d39364ca2678ac07208919497bda3bbab975be95

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
