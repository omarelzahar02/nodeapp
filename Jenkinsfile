pipeline {	
	agent {
		docker {
			image 'node:latest'
		}
	}
    stages {	
        stage('Build') {	
            steps {	
                git url: 'https://github.com/nodejs/nodejs.org.git'
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
