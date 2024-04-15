FROM debian:bullseye

RUN apt update && apt install -y --no-install-recommends \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists* \
    && apt clean
    
RUN mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=NORMANDY/L=LEHAVRE/O=42/OU=42/CN=arazzok.42.fr/UID=arazzok"

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
