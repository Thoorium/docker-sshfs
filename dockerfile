FROM alpine:latest

RUN apk add --no-cache bash sshfs sshpass && \
    ln -s /config /root/.ssh

COPY ./entrypoint.sh /entrypoint.sh

VOLUME ["/mount", "/config"]

ENV UID=0 GID=0 PORT=22 IDENTITY_FILE=/config/id_ed25519 SSHPASS=

ENTRYPOINT ["/entrypoint.sh"]