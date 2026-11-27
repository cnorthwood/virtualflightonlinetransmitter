FROM php:8.5-apache@sha256:256c25149bca6639f538ece3c5dda90684409227dec546b87ca174950569b8f1

RUN a2enmod rewrite
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# k3s pod network: Traefik's pod IP changes on every restart, so trust the whole range.
# %a rather than %h so the access log shows the address mod_remoteip resolved.
RUN a2enmod remoteip && cat >/etc/apache2/conf-enabled/remoteip.conf <<'EOF'
RemoteIPHeader X-Forwarded-For
RemoteIPInternalProxy 10.42.0.0/16
LogFormat "%a %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
EOF

COPY server/ /var/www/html/
