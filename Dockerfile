FROM joomla:php7.3

# Install apt packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libtidy-dev \
    && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Install PHP XDebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install and enable PHP extensions
RUN docker-php-ext-install tidy
RUN docker-php-ext-enable tidy

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP CodeSniffer
RUN /usr/local/bin/composer global require squizlabs/php_codesniffer "~3.5" && \
    ln -s ~/.composer/vendor/squizlabs/php_codesniffer/bin/phpcs /usr/bin/phpcs

# Install !Joomla Coding Standards for PHP CodeSniffer
RUN /usr/local/bin/composer global require joomla/coding-standards "~3.0@alpha"
