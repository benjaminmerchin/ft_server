FROM debian:buster

MAINTAINER bmerchin

RUN apt-get update && apt-get install -y \
	wget \
	nginx \
	openssl \
	mariadb-server \
	mariadb-client \
	gettext-base

RUN apt-get install -y \
	php7.3 \
	php7.3-mysql \
	php7.3-fpm \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-xml \
	php7.3-xmlrpc \
	php7.3-zip 

ENV auto_index=on

COPY srcs/ .

CMD bash start.sh && echo "\033[44;1m\n\t\t\tHello\n\t\t\t\tfrom\n\t\t\t\t\tthe\n\t\t\t\t\t\tother\n\t\t\t\t\t\t\tside\033[0m" && bash

#docker rmi my_image
#docker build -t my_image .

#By default autoindex is on
#docker run --rm --name my_container -it -p 8080:80 -p 443:443 my_image
#docker run --rm --name my_container -it -e auto_index=off p 8080:80 -p 443:443 my_image
