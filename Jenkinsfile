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
        stage('Deploy') {	
            steps {	
                sh 'cat /etc/lsb-release'
            }	
        }			
    }	
}
