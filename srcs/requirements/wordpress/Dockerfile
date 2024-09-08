FROM debian:bullseye

RUN apt update && apt install -y \
    software-properties-common \
    ca-certificates \
    lsb-release \
    apt-transport-https \
    gnupg \
    wget \
    && rm -rf /var/lib/apt/lists* \
    && apt clean

# Enable SURY repository
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

# Import SURY GPG key
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt update && apt install -y \
    php8.3 \
    php8.3-fpm \
    php8.3-mysql \
    && rm -rf /var/lib/apt/lists* \
    && apt clean

COPY ./conf/php.conf /etc/php/8.3/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-6.6.1.tar.gz \
    && tar -xvzf wordpress-6.6.1.tar.gz \
    && chown -R root:root /var/www/html/wordpress \
    && rm -rf wordpress-6.6.1.tar.gz

WORKDIR /

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/init_wordpress.sh /init_wordpress.sh

RUN chmod +x /init_wordpress.sh

ENTRYPOINT ["/init_wordpress.sh"]
