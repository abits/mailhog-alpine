#!/bin/sh

set -eo pipefail

if [ -z "$MAILHOG_PASSWORD" ]; then
     MAILHOG_PASSWORD="mailhog-secret"
fi

mkdir -p /etc/mailhog

password=$(MailHog bcrypt $MAILHOG_PASSWORD)
echo "mailhog:$password" > /etc/mailhog/secret
chmod 700 /etc/mailhog/secret

exec /go/bin/MailHog -auth-file=/etc/mailhog/secret
