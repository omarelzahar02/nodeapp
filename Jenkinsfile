pipeline {	
	agent {
		docker {
			image 'node:latest'
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
