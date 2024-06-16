docker run \
    -p 8443:443 \
    -p 8080:80 \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\server.pem:/etc/nginx/ssl/server.pem \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\server.key:/etc/nginx/ssl/server.key \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx