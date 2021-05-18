FROM joomla:php7.3

# Install PHP XDebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP CodeSniffer
RUN /usr/local/bin/composer global require squizlabs/php_codesniffer "~3.5" && \
    ln -s ~/.composer/vendor/squizlabs/php_codesniffer/bin/phpcs /usr/bin/phpcs

# Install !Joomla Coding Standards for PHP CodeSniffer
RUN /usr/local/bin/composer global require joomla/coding-standards "~3.0@alpha"

# RUN apt-get update && apt-get install -y \
#     gnupg2 \
#     socat \
#     && \
#     rm -rf /var/lib/apt/lists/* && \
#     apt-get clean
