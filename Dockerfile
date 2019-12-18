# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    sonar-scanner-typescript
# name:     minddocdev/sonar-scanner-typescript
# repo:     https://github.com/minddocdev/sonar-scanner-typescript
# Requires: newtmitch/sonar-scanner:3.3.0-alpine
# authors:  development@minddoc.com
# ------------------------------------------------------
FROM alpine:latest as runtime

RUN apk add -U gpgme
RUN gpg || true

ENTRYPOINT ["sh", "/entrypoint.sh"]

FROM runtime as testEnv
RUN apk add --no-cache coreutils bats ncurses
ADD test.bats /test.bats
ADD mock.sh /usr/bin/gpg
RUN /test.bats

FROM runtime
