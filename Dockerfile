FROM debian:buster

MAINTAINER bmerchin

RUN apt-get update && apt-get install -y \
	wget \
	nginx

#Rajouter openssl mariadb-server

#COPY srcs/. .

#COPY srcs/start.sh .
#COPY srcs/ngnix-config .
#COPY srcs/wp-config.php .
#COPY srcs/phpmyadmin-config.inc.php .

CMD echo "Hello\nfrom\nthe\nother\nside" && bash

#CMD bash start.sh
#CMD ["mkdir", "wordpress"]
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
#CMD ["cd", "wordpress"]



