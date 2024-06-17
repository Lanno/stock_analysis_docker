docker run \
    -p 443:443 \
    -p 80:80 \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\server.pem:/etc/nginx/ssl/server.pem \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\server.key:/etc/nginx/ssl/server.key \
    -v D:\\Development\\Projects\\finance\\stock_analysis_docker\\nginx\\nginx.conf:/etc/nginx/nginx.conf:ro \
    --env-file D:\\Development\\Projects\\finance\\stock_analysis_panel\\.env \
    nginx
