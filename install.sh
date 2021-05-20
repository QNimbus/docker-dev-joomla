#!/bin/bash

# Simple configure script to setup Joomla installation (including database)
#
# Usage: ./configure.sh

CURRENT_DIR=$(pwd)

# Copy configuration.php to Joomla! root folder
docker cp ./docker/configuration.php joomla:/var/www/html/configuration.php
docker exec -i joomla /bin/bash -c 'chown www-data:www-data configuration.php'

# Install Joomla! dev database (Joomla! admin:admin user)
docker exec -i joomla_mysql /bin/bash -c 'mysql --user root --password=mysql' < ./docker/joomla.db.sql

# Remove Joomla! installation folder
docker exec -i joomla /bin/bash -c 'rm -rf /var/www/html/installation'
