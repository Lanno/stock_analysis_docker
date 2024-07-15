ssh-agent
ssh-add /c/Users/noluc/.ssh/nginx-dev-00.pem
winpty ssh -R 8443:localhost:443 ubuntu@ec2-18-237-96-173.us-west-2.compute.amazonaws.com -o ServerAliveInterval=60 -o ServerAliveCountMax=5
