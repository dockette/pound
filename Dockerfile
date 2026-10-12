FROM debian:trixie-slim

LABEL maintainer="Milan Sulc <sulcmil@gmail.com>"

RUN apt-get update && \
    apt-get install --no-install-recommends -y pound && \
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# Pound configuration
ADD ./pound/pound.cfg /etc/pound/config.cfg

CMD ["pound", "-f", "/etc/pound/config.cfg"]
