pipeline {	
	agent {
		docker {
			image 'node:18-alpine'
		}
	}
      environment {
        HOME = '.'
    }
    stages {	
        stage('Build') {	
            steps {	
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
