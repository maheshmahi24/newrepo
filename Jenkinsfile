pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 #aws configure set aws_access_key_id $ACCESS_KEY
		 #aws configure set aws_secret_access_key $ACCESS_SECRET_KEY
		 #aws configure set default.region us-east-1
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
			
			 ssh -i /var/lib/jenkins/.ssh/application.pem ubuntu@ec2-18-234-224-28.us-east-1.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
			  '''	 
		    
      		}
		}		    

}

 }
