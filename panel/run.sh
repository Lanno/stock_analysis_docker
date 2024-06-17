docker run \
    -p 8500:8501 \
    --env-file ../../stock_analysis_panel/.env \
    -v D:\\Development\\Projects\\finance\\stock_analysis_panel\\data:/srv/stock_analysis_panel/data \
    703178115275.dkr.ecr.us-west-2.amazonaws.com/analysis_panel:v1