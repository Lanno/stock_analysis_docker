docker run \
    -p 8443:443 \
    -p 8080:80 \
    -v $(pwd)/server.pem:/etc/nginx/ssl/server.pem \
    -v $(pwd)/server.key:/etc/nginx/ssl/server.key \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx nginx -t
