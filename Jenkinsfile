pipeline {
   agent any // run on any available agent
    environment {
        // define environment variables
        NODE_ENV = 'production'
        PORT = 3000

    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
                //sh './jenkins/scripts/test.sh'
            }
        }
    }
}
