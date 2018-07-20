FROM php:7.1.9-apache
ARG TIMEZONE

LABEL maintainer="Victor Cifuentes <creyent@gmail.com>"
LABEL version="1.1"

# Install updates and basic funcs
RUN apt-get update \
    && buildDeps="libpq-dev libzip-dev" \
    && apt-get install -y $buildDeps git nano --no-install-recommends \
    && apt-get clean

# Install PHP extensions, Type docker-php-ext-install to see available extensions
RUN /usr/local/bin/docker-php-ext-install mysqli

# Install Composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo ${TIMEZONE} > /etc/timezone \
    && echo "date.timezone=`cat /etc/timezone`" > /usr/local/etc/php/conf.d/timezone.ini

RUN a2enmod proxy \
&& a2enmod proxy_http \
&& a2enmod proxy_balancer lbmethod_byrequests \
&& service apache2 stop

# Config aliases for synfony commands
RUN echo 'alias sf="php bin/console"' >> ~/.bashrc