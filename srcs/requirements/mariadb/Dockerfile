FROM debian:bullseye

RUN apt update && apt install -y --no-install-recommends \
    mariadb-server \
    && rm -rf /var/lib/apt/lists* \
    && apt clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/init_db.sh /init_db.sh

RUN chmod +x /init_db.sh

ENTRYPOINT /init_db.sh
