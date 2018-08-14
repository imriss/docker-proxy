FROM imriss/docker-squid

MAINTAINER Reza Farrahi <imriss@yahoo.com>

RUN pacman -Syyu --noconfirm --needed \
 && pacman -S --noconfirm --needed iptables \
 && rm -rf /var/cache/pacman/pkg/* \

# Customise and build Squid.
# It's silly, but run dpkg-buildpackage again if it fails the first time. This
# is needed because sometimes the `configure` script is busy when building in
# Docker after autoconf sets its mode +x.
COPY mime.conf /root/
RUN mkdir -p /etc/squid/ssl_cert \
    && cat /root/mime.conf >> /etc/squid/mime.conf

COPY squid.conf /etc/squid/squid.conf
COPY start_squid.sh /usr/local/bin/start_squid.sh

VOLUME /var/cache/squid /etc/squid/ssl_cert
EXPOSE 3128 3129 3130

CMD ["/usr/local/bin/start_squid.sh"]
