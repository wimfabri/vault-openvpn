FROM golang:alpine

LABEL maintainer "Knut Ahlers <knut@ahlers.me>"

ADD . /go/src/github.com/Luzifer/vault-openvpn
ADD ./vault /opt/vault
ADD ./vault-openvpn.yaml  /root/.config/vault-openvpn.yaml
WORKDIR /go/src/github.com/Luzifer/vault-openvpn

RUN apk add --no-cache bash

RUN set -ex \
 && apk add --update git ca-certificates \
 && go install -ldflags "-X main.version=$(git describe --tags || git rev-parse --short HEAD || echo dev)" \
 && apk del --purge git

WORKDIR /go/src/github.com/Luzifer/vault-openvpn

ENTRYPOINT ["/opt/vault/entrypoint.sh"]
CMD ["--"]
