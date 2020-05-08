FROM alpine:3.10
MAINTAINER Andreson Thiago <andreson.thiago@gmail.com>
RUN apk update && apk upgrade

RUN apk add  nodejs-current

RUN apk add --update npm

RUN npm install -g json-server
RUN mkdir /data
COPY  ./db.json /data/db.json

#SHELL ["/bin/bash","-c"]

EXPOSE 3636
RUN echo 'Iniciando json server na porta 3636'
ENTRYPOINT json-server  --watch /data/db.json -H 0.0.0.0  --port 3636
