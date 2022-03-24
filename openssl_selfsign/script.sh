openssl req -new -x509  -sha256 -nodes -newkey rsa:2048 -days 3560 -keyout server.key -out server.cert -config selfsign.cnf
