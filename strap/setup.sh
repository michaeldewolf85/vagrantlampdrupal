#!/bin/bash
# Configure a LAMP stack.
# We set DEBIAN_FRONTEND to noninteractive in order to bypass all prompts that
# require user input.
export DEBIAN_FRONTEND=noninteractive
# Ensure that downloads are the latest versions.
apt-get update
# Get Apache, MySQL and PHP.
apt-get install apache2 mysql-server php5 libapache2-mod-php5 php5-mysql php-pear -y
# Add a servername to httpd.conf in order to avoid Apache warning.
echo "ServerName localhost" | sudo tee /etc/apache2/httpd.conf
# Restart apache so it updates its configuration.
service apache2 restart
# Install drush.
pear channel-discover pear.drush.org
pear install drush/drush