FROM nginx:latest

RUN mkdir /etc/nginx/ssl
RUN openssl dhparam 2048 -out /etc/nginx/ssl/dhparam.pem

RUN apt-get update && apt-get install -y curl iputils-ping iproute2 dnsutils

RUN rm -f /etc/nginx/conf.d/*
ADD ./server1/nginx_conf/* /etc/nginx/conf.d/

ADD ./server.csr /etc/nginx/ssl/
ADD ./server.key /etc/nginx/ssl/

ADD ./server.csr /usr/local/share/ca-certificates/example.crt
RUN update-ca-certificates
