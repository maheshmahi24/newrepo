pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 #aws configure set aws_access_key_id $ACCESS_KEY
		 #aws configure set aws_secret_access_key $ACCESS_SECRET_KEY
		 #aws configure set default.region ap-southeast-1
                 aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com
		 docker build -t automation-docker .
		 docker tag automation-docker:latest 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/automation-docker:${BUILD_NUMBER}
		 docker push 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/automation-docker::${BUILD_NUMBER}
	
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			

	         ssh -i /var/lib/jenkins/.ssh/build.pem -o StrictHostChecking=no ubuntu@ec2-13-250-35-13.ap-southeast-1.compute.amazonaws.com 'bash -s' < ./deploy.sh\${BUILD_NUMBER}
			 
			'''	 
		    
      		}
		}		    

}

 }
