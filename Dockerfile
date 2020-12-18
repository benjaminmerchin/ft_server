FROM debian:buster

MAINTAINER bmerchin

RUN apt-get update && apt-get install -y \
	wget \
	nginx \
	openssl \
	mariadb-server \
	mariadb-client

RUN apt-get install -y \
	php7.3 \
	php-mysql \
	php7.3-fpm \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip 

#COPY srcs/start.sh .
COPY srcs/ .
#COPY srcs/wp-config.php .
#COPY srcs/phpmyadmin-config.inc.php .

CMD bash start.sh && echo "Hello\nfrom\nthe\nother\nside" && bash


#CMD bash start.sh
#CMD ["mkdir", "wordpress"]
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
#CMD ["cd", "wordpress"]



