pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 aws configure set aws_access_key_id $ACCESS_KEY
		 aws configure set aws_secret_access_key $SECRET_KEY
		 aws configure set default.region us-east-1
		 aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.us-east-1.amazonaws.com
		 docker build -t practice-dkr .
		 docker tag practice-dkr:latest 092101872227.dkr.ecr.us-east-1.amazonaws.com/practice-dkr:${BUILD_NUMBER}
		 docker push 092101872227.dkr.ecr.us-east-1.amazonaws.com/practice-dkr:${BUILD_NUMBER}
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			
			  ssh -i "dkr.pem" -o StricHostChecking=no ubuntu@ec2-52-90-236-143.compute-1.amazonaws.com 
			  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.us-east-1.amazonaws.com
			  docker pull 092101872227.dkr.ecr.us-east-1.amazonaws.com/practice-dkr:${BUILD-NUMBER}
			  docker run -itd -p 3000:3000 --name dotnet 092101872227.dkr.ecr.us-east-1.amazonaws.com/practice-dkr:${BUILD-NUMBER}

			  '''	 
		    
      		}
		}		    

}

 }
