pipeline {	
	agent {
		docker {
			image 'node:18-alpine'
		}
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
