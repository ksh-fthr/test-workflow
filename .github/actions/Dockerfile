FROM golang:1.13-alpine AS builder

RUN set -eux; \
      apk add --no-cache --virtual .build-deps git
RUN go get github.com/b4b4r07/github-labeler

FROM alpine
COPY --from=builder /go/bin/github-labeler /usr/bin/github-labeler
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
