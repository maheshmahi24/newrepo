aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.us-east-1.amazonaws.com
docker pull 092101872227.dkr.ecr.us-east-1.amazonaws.com/practice-dkr:latest:$1
docker ps -a
docker rm -f dotnet-app | ls -la
docker ps -a
docker run -itd -p 3000:3000 --name dockerdeploy  092101872227.dkr.ecr.us-east-1.amazonaws:$1
docker ps -a
