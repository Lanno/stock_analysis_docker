aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 703178115275.dkr.ecr.us-west-2.amazonaws.com
docker tag analysis_panel:v1 703178115275.dkr.ecr.us-west-2.amazonaws.com/analysis_panel:analysis_panel
docker pull 703178115275.dkr.ecr.us-west-2.amazonaws.com/analysis_panel:v1