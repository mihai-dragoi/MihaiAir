FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

COPY nginx_signing.key nginx_signing.key
COPY source.list /etc/apt/source.list

# install Debian packages
RUN \
echo "deb http://security.debian.org jessie/updates main" > /etc/apt/sources.list && \
echo "deb http://ftp.us.debian.org/debian jessie main" >> /etc/apt/sources.list && \
apt-get update -y && \
apt-get install -y apt-transport-https && \
apt-key add nginx_signing.key && \
echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list && \
echo "deb https://packages.elastic.co/beats/apt stable main" >> /etc/apt/sources.list && \
apt-get update -y && \
apt-get install -y sudo nginx php5-fpm php5-cli php5-curl php5-memcache php5-memcached php5-mysql cron supervisor nano less \
                   htop wget curl git vim mysql-client \
                   gcc nasm build-essential make && \
rm -rf /var/lib/apt/lists/* && \
rm /etc/nginx/conf.d/default.conf

# tweak nginx and php-fpm
RUN \
sed -i -e "s/keepalive_timeout[[:space:]]\+[0-9]\+;/keepalive_timeout 15;\n\tclient_max_body_size 8m;\n\tserver_tokens off;/" /etc/nginx/nginx.conf && \
sed -i -e "s/user  nginx;/user  www-data;/" /etc/nginx/nginx.conf && \
sed -i -e "s/pm.max_children = 5/pm.max_children = 15/" /etc/php5/fpm/pool.d/www.conf && \
echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY etc/ /etc/
COPY .    /var/www/

ADD docker/init.web.sh /docker/init.web.sh
RUN chmod a+x /docker/init.web.sh

WORKDIR /var/www

RUN \
chown -R www-data:www-data /var/www && \
crontab -u www-data /etc/cron.d/mihaiair

EXPOSE 80

VOLUME ["/var/log"]

CMD ["/usr/bin/supervisord"]
