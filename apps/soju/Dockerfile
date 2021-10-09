FROM golang:alpine AS build-env

ARG VERSION

RUN apk add --no-cache gcc libc-dev git curl && \
    mkdir -p /build/app /build/config && \
    curl -fsSL https://github.com/emersion/soju/releases/download/v${VERSION}/soju-${VERSION}.tar.gz | tar -xz

WORKDIR /go/soju-${VERSION}
RUN go build -o /build/app/soju cmd/soju/main.go && \
    go build -o /build/app/sojuctl cmd/sojuctl/main.go

COPY entrypoint.sh /build/app/entrypoint.sh

FROM alpine:3.14.2
RUN apk add --no-cache bash ca-certificates openssl
WORKDIR /app
COPY --from=build-env /build/ /
CMD ["/app/entrypoint.sh"]
