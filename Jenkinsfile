pipeline {	
	agent any
      environment {
        HOME = '.'
        npm_config_cache = 'npm-cache'
        DOCKERHUB_CREDENTIALS = credentials('omarelzahar-dockerhub')
        registry = "omarelzahar/gold"
        registryCredential = 'omarelzahar-dockerhub'
        dockerImage = ''
        AWS_ACCOUNT_ID="780026208030"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_REPO_NAME="jenkins-docker"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
        THE_BUTLER_SAYS_SO=credentials('omarelzahar-aws-creds')
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
      stage('Sonarqube Scan') {
        steps{
                  script {
                        checkout scm
                    }
                    catchError() {
                        sh '''
                        sonar-scanner \
                            -Dsonar.projectKey=api.identity.ciba \
                            -Dsonar.host.url=http://http://44.211.70.180:9000 \
                            -Dsonar.login=squ_d48d3a59a6a6a61e568433fcde79316321492dca
                        '''
                    }
        }
      }
      stage('Login to Docker Hub') {         
        steps{                            
        	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
        	echo 'Login Completed'                
          }           
        }  
      stage('Building image') {
        steps{
          script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
          }
      stage('Deploy Image') {
        steps{
           script {
              docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
            }
          }
        }
      }
      stage('Logging into AWS ECR') {
            steps {
                script {
                sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }
                 
            }
        }
      stage('Building image for ECR') {
          steps{
            script {
              dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
            }
          }
        }
      stage('Pushing to ECR') {
       steps{  
           script {
                  sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                  sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
           }
          }
        }
    }	
}
