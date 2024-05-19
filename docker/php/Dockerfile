FROM php:8.1-fpm

# Copy custom php.ini
COPY docker/php/php.ini /usr/local/etc/php/php.ini

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# install Node.js
COPY --from=node:lts /usr/local/bin /usr/local/bin
COPY --from=node:lts /usr/local/lib /usr/local/lib

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libssl-dev \
    && docker-php-ext-install pdo_mysql exif pcntl bcmath gd zip \
    && docker-php-ext-install intl \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www