FROM httpd:2.4
LABEL MAINTAINER="Adrian GP <adriangp@github.com>"
RUN \
	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y php7.2 libapache2-mod-php php-mysql php-gd git && \
	rm /var/www/html/* && \
	git clone https://github.com/WordPress/WordPress.git /var/www/html && \        
	ln -sf /dev/stderr /var/log/apache2/error.log && \
        ln -sf /dev/stdout /var/log/apache2/access.log && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"] 

