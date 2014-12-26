#!/bin/bash
# Configure a LAMP stack.
# We set DEBIAN_FRONTEND to noninteractive in order to bypass all prompts that
# require user input.
export DEBIAN_FRONTEND=noninteractive
# Ensure that downloads are the latest versions.
apt-get update
# Get Apache.
apt-get install apache2 -y
# Add a servername to httpd.conf in order to avoid Apache warning.
echo "ServerName localhost" | sudo tee /etc/apache2/httpd.conf
# Get MySQL and PHP.
apt-get install mysql-server php5 libapache2-mod-php5 php5-mysql php5-gd php-pear -y
# Install drush.
pear channel-discover pear.drush.org
pear install drush/drush
# Configure virtualhost for drupal.dev
cp /etc/apache2/sites-available/default /etc/apache2/sites-available/drupal.dev
sed -i 's/ServerAdmin webmaster@localhost/ServerAdmin michaeldewolf85@gmail.com\n        ServerName www.drupal.dev\n        ServerAlias drupal.dev/g' /etc/apache2/sites-available/drupal.dev
sed -i 's/DocumentRoot \/var\/www/DocumentRoot \/vagrant\/docroot/g' /etc/apache2/sites-available/drupal.dev
sed -i 's/<Directory \/var\/www\/>/<Directory \/vagrant\/docroot\/>/g' /etc/apache2/sites-available/drupal.dev
a2ensite drupal.dev
# Restart apache so it updates its configuration.
service apache2 restart
# Create MySQL database for Drupal.
echo "CREATE DATABASE drupal" | mysql -uroot -h127.0.0.1
# Install Drupal in new db.
cd /vagrant/docroot
drush site-install --db-url=mysql://root:@localhost/drupal --account-name=admin --account-pass=drupal --site-name="Drupal Sandbox" -y
