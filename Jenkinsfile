pipeline {
   agent any // run on any available agent
   options {
     skipDefaultCheckout(true)
   }
  
    stages {
        stage('Build') {
            git url: 'https://github.com/omarelzahar02/nodeapp.git'
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
}
