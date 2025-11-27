FROM docker:dind

# Install Wings
RUN mkdir -p /etc/pelican /var/run/wings && \
    sudo curl -L -o /usr/local/bin/wings "https://github.com/pelican-dev/wings/releases/latest/download/wings_linux_amd64" && \
    sudo chmod u+x /usr/local/bin/wings

ENTRYPOINT ["/usr/local/bin/wings"]
CMD ["--config", "/config/pelican/config.yml"]
