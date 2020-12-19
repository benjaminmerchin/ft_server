service mysql start
mv ngnix.conf etc/nginx/sites-available/default

#Install Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfvz latest.tar.gz && rm latest.tar.gz
mkdir -p /var/www/html/localhost
mv wordpress/* /var/www/html/localhost/.
rmdir wordpress
mv wp-config.php /var/www/html/localhost/.

#Create Database in Wordpress
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "UPDATE mysql.user set plugin='mysql_native_password' WHERE user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#Install PhpMyAdmin
cd /var/www/html/localhost
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english phpmyadmin
mv ../../../../config.inc.php phpmyadmin/. && cd && cd ..

#SSL
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=benjamin/CN=localhost"

#Run php
service nginx start
service mysql restart
service php7.3-fpm start
