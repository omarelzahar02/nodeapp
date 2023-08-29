pipeline {	
	agent {
		docker {
			image 'node:18-alpine'
		}
	}
      environment {
        HOME = '.'
        npm_config_cache = 'npm-cache'
        DOCKERHUB_CREDENTIALS = credentials('omarelzahar-dockerhub')
    }
    stages {	
        stage("install dependencies") {	
            steps {	
                sh 'npm remove node_modules'
                sh 'npm remove package-lock.json'
                sh 'npm -v' // sanity check
                sh 'npm install'
            }	
        }	
        stage(" "){
          parallel {
            stage("Test") {
              steps {
                sh 'npm run  test:unit'
              }
            }
            
          stage("Build") {
              steps {
                sh 'npm run build'
              }
            }
        }
      }	
      stage('Login to Docker Hub') {         
        steps{                            
        	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
        	echo 'Login Completed'                
          }           
        }          
    }	
}
