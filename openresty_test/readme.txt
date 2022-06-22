# build docker image
sudo docker build -t openresty_test .

# run docker container
sudo docker run --name openresty_test -p 8888:80 -d openresty_test

# access with curl
curl -v -X POST --data-urlencode "name=太郎" "http://127.0.0.1:8888"

# view log
sudo docker exec openresty_test cat /var/log/openresty_error.log
