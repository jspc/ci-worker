FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --update kubectl docker terraform texlive-full ca-certificates texinfo alpine-sdk bash
