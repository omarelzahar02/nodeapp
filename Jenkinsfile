pipeline {
    agent {
        docker {
            image 'node:latest'
            args '-p 3000:3000 -p 5000:5000' 
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'sudo chown -R 115:122 "/.npm"'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
