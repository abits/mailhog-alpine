FROM golang:1.4-alpine

RUN apk add --update git && \

    go get github.com/mailhog/MailHog && \

    apk del --purge \
        git \
        pcre \
        curl \
        libssh2 \
        ca-certificates \
        openssl \
        expat && \

    rm -rf /var/cache/apk/*

EXPOSE 1025 8025

COPY docker-entrypoint.sh /usr/local/bin/
CMD "docker-entrypoint.sh"
