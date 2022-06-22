FROM openresty/openresty:1.21.4.1-1-bullseye-fat

RUN apt update && apt -y upgrade && \
    apt -y install lua-cjson && \
    apt -y install vim-tiny

COPY ./nginx.conf /etc/openresty/
COPY ./default.conf /etc/nginx/conf.d/
