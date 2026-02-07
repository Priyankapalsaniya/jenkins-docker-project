pipeline {
    agent any

    environment {
        IMAGE_NAME = "priyankapalsaniya/jenkins-demo"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        chmod +x scripts/build_push.sh
                        scripts/build_push.sh
                    '''
                }
            }
        }
    }
}
