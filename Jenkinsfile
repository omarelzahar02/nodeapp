pipeline {
   agent any // run on any available agent
   options {
     skipDefaultCheckout(true)
   }
  
    stages {
        stage('Build') {
            steps {
                //git url: 'https://github.com/omarelzahar02/nodeapp.git'
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
}
