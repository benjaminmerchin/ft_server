#Run nginx
service nginx start

#Run Mysql
service mysql start

#Run php
service php7.3-fpm start

#Install Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfvz latest.tar.gz && rm latest.tar.gz
mkdir -p /var/www/html/localhost
mv -r wordpress/* /var/www/html/localhost && rmdir wordpress

#Create Database in Wordpress
echo "create database wordpress;" | mysql
echo "create user 'wordpress'@'localhost';" | mysql

#Install PhpMyAdmin
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english phpmyadmin
cd phpmyadmin
mv ../../../../phpmyadmin-config.inc.php .

