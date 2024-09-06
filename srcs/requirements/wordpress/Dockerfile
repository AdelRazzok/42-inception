FROM debian:bullseye

RUN apt update && apt install -y \
    php \
    php-fpm \
    php-mysql \
    wget \
    && rm -rf /var/lib/apt/lists* \
    && apt clean

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && chown -R root:root /var/www/html/wordpress

WORKDIR /

ENTRYPOINT ["/bin/bash"]