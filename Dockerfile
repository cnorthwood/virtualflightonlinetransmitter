FROM php:8.5-apache@sha256:08af36df144462d84c7f16190557eec06cb9f656882685610b712a15eec54d46

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY server/ /var/www/html/
