openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out server.key
openssl req -new -key server.key -out server.csr -subj "/C=US/ST=CA/L=Tustin/O=Secret/OU=Secret/CN=Secret/emailAddress=noluck589@gmail.com"
openssl x509 -signkey server.key -in server.csr -req -days 365 -out server.pem