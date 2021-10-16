FROM rust:1.55.0 as build

ARG VERSION

RUN mkdir /app && \
    cargo install --git https://github.com/osa1/tiny --tag v${VERSION} --root /app/ && \
    /app/bin/tiny --version

FROM ubuntu:xenial-20210804
COPY --from=build /app/bin/tiny /tiny
CMD ["sleep", "infinity"]
