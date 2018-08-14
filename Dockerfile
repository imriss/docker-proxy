FROM imriss/docker-squid

MAINTAINER Reza Farrahi <imriss@yahoo.com>

ENV SQUID_VERSION=4.2 \
    SQUID_CACHE_DIR=/var/cache/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN pacman -Syyu --noconfirm --needed \
 && pacman -S --noconfirm --needed squid iproute2 iptables \
 && rm -rf /var/cache/pacman/pkg/* \
 && groupadd proxy \
 && useradd -g proxy proxy

# Customize
COPY mime.conf /root/
RUN mkdir -p /etc/squid/ssl_cert \
    && cat /root/mime.conf >> /etc/squid/mime.conf

COPY squid.conf /etc/squid/squid.conf
COPY start_squid.sh /usr/local/bin/start_squid.sh

VOLUME /var/cache/squid /etc/squid/ssl_cert
EXPOSE 3128 3129 3130

ENTRYPOINT []
CMD ["/usr/local/bin/start_squid.sh"]
