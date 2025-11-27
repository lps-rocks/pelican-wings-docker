FROM docker:dind-alpine

# Install Required packages
RUN apk add --no-cache \
    bash \
    curl \
    tar \
    xz \
    ca-certificates \
    iptables \
    tzdata \
    shadow

# Install Wings
RUN mkdir -p /etc/pelican /var/run/wings && \
    curl -L -o /usr/local/bin/wings "https://github.com/pelican-dev/wings/releases/latest/download/wings_linux_amd64" && \
    chmod u+x /usr/local/bin/wings

# Use /config for all data
VOLUME ["/config"]

WORKDIR ["/config/pelican/"]
ENTRYPOINT ["/usr/local/bin/wings"]
CMD ["--config", "/config/pelican/config.yml"]
