service mysql start
mv ngnix.conf etc/nginx/sites-available/default

#Install Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfvz latest.tar.gz && rm latest.tar.gz
mkdir -p /var/www/html/localhost
mv wordpress/* /var/www/html/localhost/.
rmdir wordpress
mv wp-config.php /var/www/html/localhost/.
