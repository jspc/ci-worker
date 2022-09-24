FROM alpine:edge

RUN apk add --update kubectl docker terraform texlive -full ca-certificates texinfo alpine-sdk bash
