FROM alpine:latest

RUN apk add --no-cache bash sshfs sshpass && \
    ln -s /config /root/.ssh

COPY ./entrypoint.sh /entrypoint.sh

VOLUME ["/mount", "/config"]

ENV UID=1000 GID=1000 PORT=22 IDENTITY_FILE=/config/id_rsa SSHPASS=

ENTRYPOINT ["/entrypoint.sh"]