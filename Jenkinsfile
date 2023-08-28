pipeline {	
	agent {
		docker {
			image 'node:18-alpine'
		}
	}
      environment {
        HOME = '.'
        npm_config_cache = 'npm-cache'
    }
    stages {	
        stage('Build') {	
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
    }	
}
