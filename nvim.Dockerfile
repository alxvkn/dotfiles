FROM alpine:latest

WORKDIR /root/

RUN apk add --no-cache \
    neovim \
    git \
    gcc \
    musl-dev \
    make

ENTRYPOINT ["nvim"]
