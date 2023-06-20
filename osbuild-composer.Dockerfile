FROM quay.io/fedora/fedora:37

RUN dnf -y install dnf-plugins-core
RUN dnf -y copr enable @osbuild/osbuild

RUN dnf -y install osbuild-composer composer-cli socat jq
COPY osbuild-composer-*.* /etc/systemd/system/
RUN systemctl enable \
  osbuild-composer.socket \
  osbuild-composer-proxy.socket
EXPOSE 8080

CMD ["/sbin/init"]

RUN rm -rf /var/cache/dnf/*
