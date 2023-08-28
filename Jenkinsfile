pipeline {
   agent any // run on any available agent
   options {
     skipDefaultCheckout(true)
   }
    environment {
        // define environment variables
        NODE_ENV = 'production'
        PORT = 3000
    }
    stages {
        stage('Build') {
            steps {
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
    }
