Here’s the final correct pipeline assuming:

Docker Hub username = priyanka123

Jenkins credential ID = dockerhub-creds

pipeline {
    agent any

    environment {
        IMAGE_NAME = "priyanka123/jenkins-demo"
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
