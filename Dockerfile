FROM alpine:latest

RUN apk update && apk upgrade;\
    apk add doas;\
    adduser -g 'Porter' porter;\
    echo "porter:" | chpasswd;\
    adduser porter wheel;\
    echo "permit persist :wheel" > "/etc/doas.d/doas.conf"

# Run system config script
COPY .docker/config.sh /root/config.sh
RUN sh /root/config.sh

# Copy and change owner of setup scripts
COPY .docker /home/porter/.docker
RUN chown -R porter /home/porter/.docker

USER porter
WORKDIR /home/porter

# Run setup.sh as porter
RUN sh .docker/setup.sh

# Expose python binaries .venv in porter to PATH
ENV PATH="/home/porter/.venv/bin:$PATH"

# Expose npm binaries
ENV PATH="/home/porter/.npm-global/bin:$PATH"

# Set final working directory
RUN mkdir -p /home/porter/app
WORKDIR /home/porter/app

EXPOSE 3030/tcp
CMD ["zsh"]

