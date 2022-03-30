FROM golang:alpine AS build-env

ARG VERSION

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache gcc=10.3.1_git20210424-r2 libc-dev=0.7.2-r3 git=2.32.0-r0 curl=7.79.1-r0 && \
    mkdir -p /build/app /build/config && \
    curl -fsSL https://github.com/emersion/soju/releases/download/v${VERSION}/soju-${VERSION}.tar.gz | tar -xz

WORKDIR /go/soju-${VERSION}
RUN go build -o /build/app/soju cmd/soju/main.go && \
    go build -o /build/app/sojuctl cmd/sojuctl/main.go

COPY ./apps/soju/entrypoint.sh /build/app/entrypoint.sh

FROM alpine:3.15.2
RUN apk add --no-cache bash=5.1.16-r0 ca-certificates=20191127-r5 openssl=1.1.1l-r0
WORKDIR /app
COPY --from=build-env /build/ /
CMD ["/app/entrypoint.sh"]
